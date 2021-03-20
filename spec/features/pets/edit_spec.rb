# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pets edit page", type: :feature do
  describe "as a visitor" do
    describe "when I visit pet show and visit the update link" do
      describe "then fill out the form and submit" do
        it "can update pet" do
          shelter1 = create(:shelter) do |shelter|
            create_list(:pet, 1, shelter: shelter)
          end

          pet = shelter1.pets.first

          visit "/pets/#{pet.id}"

          click_link "Edit"

          expect(current_path).to eq("/pets/#{pet.id}/edit")
          expect(page).to have_css("form")

          fill_in "Name", with: "Puppy"
          fill_in "Age", with: "5"
          fill_in "Breed", with: "Lambador"
          click_button "Update Pet"

          expect(current_path).to eq("/pets/#{pet.id}")
          expect(page).to have_content("Puppy")
          expect(page).to have_content("Age: 5")
          expect(page).to have_content("Breed: Lambador")
        end
      end
    end
  end
end
