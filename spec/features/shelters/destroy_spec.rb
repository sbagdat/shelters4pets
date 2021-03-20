# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shelters edit page", type: :feature do
  describe "as a visitor" do
    describe "when I visit shelter edit and visit the delete link" do
      it "can destroy shelter" do
        shelter_with_pets = create(:shelter) do |shelter|
          create_list(:pet, 5, shelter: shelter)
        end
        pets = shelter_with_pets.pets

        visit "/shelters/#{shelter_with_pets.id}"

        click_link "Delete"

        expect(current_path).to eq("/shelters")
        expect(page).to_not have_content(shelter_with_pets.name)
        pets.each do |pet|
          expect(Pet.all).to_not include(pet)
        end
      end
    end
  end
end
