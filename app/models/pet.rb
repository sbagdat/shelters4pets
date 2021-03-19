class Pet < ApplicationRecord
  belongs_to :shelter

  validates :name, :breed, :age, presence: true
  validates :age, numericality: { only_integer: true }

  validates_associated :shelter
end
