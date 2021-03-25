# frozen_string_literal: true

class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :name, :rank, :city, presence: true
  validates :rank, numericality: { only_integer: true }

  scope :columns_for_index, -> { select(:id, :name, :created_at, :pets_count) }
  scope :all_descending, -> { columns_for_index.order(created_at: :desc) }
  scope :sort_by_pets_count, ->(sort_type) { columns_for_index.order(pets_count: sort_type) }

  def self.filter_by_name(name, exact)
    if exact
      columns_for_index.where("LOWER(name) = ?", name.downcase)
    else
      columns_for_index.where("LOWER(name) ~* ?", name.downcase)
    end
  end
end
