class Shelter < ApplicationRecord
  validates :name, :rank, :city, presence: true
  validates :rank, numericality: { only_integer: true }
end
