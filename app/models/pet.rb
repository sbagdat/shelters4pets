# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :shelter

  validates :name, :breed, :age, presence: true
  validates :age, numericality: { only_integer: true }

  validates_associated :shelter

  delegate :name, to: :shelter, prefix: true
end
