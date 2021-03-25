# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pets show page", type: :feature do
  describe "As a visitor" do
    it "can see the all attributes of a pet" do
      shelter1 = create(:shelter) do |shelter|
        create_list(:pet, 1, shelter: shelter)
      end

      pet = shelter1.pets.first

      visit "/pets/#{pet.id}"

      expect(page).to have_content(pet.name)
      expect(page).to have_content(pet.breed)
      expect(page).to have_content(pet.age)
      expect(page).to have_content(pet.shelter.name)
    end
  end
end
