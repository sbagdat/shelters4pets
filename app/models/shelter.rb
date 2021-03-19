class Shelter < ApplicationRecord
  has_many :pets

  validates :name, :rank, :city, presence: true
  validates :rank, numericality: { only_integer: true }
end
