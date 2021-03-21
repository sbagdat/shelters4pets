# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pets index page", type: :feature do
  describe "As a visitor" do
    it "can see the attributes of each adoptable pet" do
      shelter1 = create(:shelter) do |shelter|
        create_list(:pet, 1, shelter: shelter)
      end

      not_adoptable_pet = shelter1.pets.first
      adoptable_pet = create(:pet)

      visit "/pets"

      expect(page).to_not have_content(not_adoptable_pet.name)
      expect(page).to_not have_content(not_adoptable_pet.breed)
      expect(page).to_not have_content(not_adoptable_pet.age)

      expect(page).to have_content(adoptable_pet.name)
      expect(page).to have_content(adoptable_pet.breed)
      expect(page).to have_content(adoptable_pet.age)
    end

    it "can see all pets information under the shelter" do
      shelter1 = create(:shelter) do |shelter|
        create_list(:pet, 5, shelter: shelter)
      end

      pets = shelter1.pets

      visit "shelters/#{shelter1.id}/pets"

      pets.each do |pet|
        expect(page).to have_content(pet.name)
        expect(page).to have_content(pet.age)
        expect(page).to have_content(pet.breed)
      end
    end
  end
end
