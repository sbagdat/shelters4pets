# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shelters index page", type: :feature do
  describe "as a visitor" do
    describe "when I visit shelters index and visit the new shelter link" do
      describe "then fill out the form and submit" do
        it "can create new shelter" do
          visit "/shelters"

          click_link "New Shelter"

          expect(current_path).to eq("/shelters/new")
          expect(page).to have_css("form")

          fill_in "Name", with: "Shelter One"
          fill_in "Rank", with: "3"
          fill_in "City", with: "Trabzon"
          click_button "Create Shelter"

          expect(current_path).to eq("/shelters")
          expect(page).to have_content("Shelter One")
        end
      end
    end
  end
end
