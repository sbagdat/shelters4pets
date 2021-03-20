# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pets show page", type: :feature do
  describe "as a visitor" do
    describe "when I visit shelter show and visit the delete link" do
      it "can destroy the pet" do
        shelter_with_pets = create(:shelter) do |shelter|
          create_list(:pet, 5, shelter: shelter)
        end
        pet = shelter_with_pets.pets.first

        visit "/pets/#{pet.id}"

        click_link "Delete"

        expect(current_path).to eq("/pets")
        expect(page).to_not have_content(pet.name)
      end
    end
  end
end
