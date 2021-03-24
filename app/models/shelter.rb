# frozen_string_literal: true

class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :name, :rank, :city, presence: true
  validates :rank, numericality: { only_integer: true }

  scope :all_descending, -> { all.order(created_at: :desc) }
  scope :sort_by_pets_count, ->(type) { order(pets_count: type) }
  scope :filter_by_name, ->(name) { where(name: name) }
end
