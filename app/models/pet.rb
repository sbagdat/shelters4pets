# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :shelter, counter_cache: true
  before_save :make_not_adoptable, if: :shelter

  attribute :adoptable, :boolean, default: true
  attribute :age, :integer, default: 0

  validates :name, :breed, presence: true
  validates :age, numericality: { only_integer: true }

  scope :age_older_than, ->(age) { columns_for_index.where("age > ?", age) }

  def self.columns_for_index
    joins(:shelter).select(:id, :name, :breed, :age, :shelter_id, "shelters.name AS shelter_name")
  end

  def self.filter_by_name(name, exact)
    if exact
      columns_for_index.where("LOWER(pets.name) = ?", name.downcase)
    else
      columns_for_index.where("LOWER(pets.name) ~* ?", name.downcase)
    end
  end

  private

  def make_not_adoptable
    self.adoptable = false
  end
end
