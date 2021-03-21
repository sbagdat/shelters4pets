# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pets index page", type: :feature do
  describe "As a visitor" do
    it "can see the attributes of each adoptable pet" do
      shelter1 = Shelter.create!(name: "Sample Shelter", city: "City", rank: "0")

      not_adoptable_pet = shelter1.pets.create(name: "Sample name", breed: "Sample Breed", age: "45")
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

    it "can see pets filtered by greater than age" do
      shelter1 = create(:shelter)
      pet1 = shelter1.pets.create(name: "Young pet", breed: "breed 1", age: 4)
      pet2 = shelter1.pets.create(name: "Old pet", breed: "breed 3", age: 6)

      visit "shelters/#{shelter1.id}/pets"

      fill_in "Age Filter", with: 5
      click_button "Filter"

      expect(current_path).to eq("/shelters/#{shelter1.id}/pets")

      expect(page).to_not have_content(pet1.name)
      expect(page).to_not have_content(pet1.age)
      expect(page).to_not have_content(pet1.breed)

      expect(page).to have_content(pet2.name)
      expect(page).to have_content(pet2.age)
      expect(page).to have_content(pet2.breed)
    end
  end
end
