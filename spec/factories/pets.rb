# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    sequence(:name, 1000) { |n| "Pet #{n}" }
    age { rand(1..10) }
    sequence(:breed, 1000) { |n| "Breed #{n}" }
  end
end
