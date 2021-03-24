# frozen_string_literal: true

class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :name, :rank, :city, presence: true
  validates :rank, numericality: { only_integer: true }

  scope :all_descending, -> { all.order(created_at: :desc) }

  scope :sort_by_pets_count, ->(type) { joins(:pets).group("shelters.id").order("COUNT(pets.shelter_id) #{type}") }
end
