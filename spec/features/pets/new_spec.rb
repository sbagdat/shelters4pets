# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shelter pets new page", type: :feature do
  describe "as a visitor" do
    describe "when I visit shelter pets index and visit the new pet link" do
      describe "then fill out the form and submit" do
        it "can create new pet" do
          shelter = create(:shelter)
          visit "/shelters/#{shelter.id}/pets"

          click_link "New Pet"

          expect(current_path).to eq("/shelters/#{shelter.id}/pets/new")
          expect(page).to have_css("form")

          fill_in "Name", with: "Coal"
          fill_in "Breed", with: "Coban"
          fill_in "Age", with: "5"
          click_button "Create Pet"

          expect(current_path).to eq("/shelters/#{shelter.id}/pets")
          expect(page).to have_content("Coal")
          expect(page).to have_content("Coban")
          expect(page).to have_content("5")
        end
      end
    end
  end
end
