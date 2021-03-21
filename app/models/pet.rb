# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :shelter, optional: true
  before_save :make_not_adoptable, if: :shelter

  attribute :adoptable, :boolean, default: true
  attribute :age, :integer, default: 0

  validates :name, :breed, presence: true
  validates :age, numericality: { only_integer: true }

  delegate :name, to: :shelter, prefix: true

  private

  def make_not_adoptable
    self.adoptable = false
  end
end
