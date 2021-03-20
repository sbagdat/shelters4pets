# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shelters edit page", type: :feature do
  describe "as a visitor" do
    describe "when I visit shelter show and visit the update link" do
      describe "then fill out the form and submit" do
        it "can update shelter" do
          shelter = create(:shelter)

          visit "/shelters/#{shelter.id}"

          click_link "Edit"

          expect(current_path).to eq("/shelters/#{shelter.id}/edit")
          expect(page).to have_css("form")

          fill_in "Name", with: "Shelter One"
          fill_in "Rank", with: "5"
          fill_in "City", with: "Konya"
          click_button "Update Shelter"

          expect(current_path).to eq("/shelters/#{shelter.id}")
          expect(page).to have_content("Shelter One")
          expect(page).to have_content("Rank: 5")
          expect(page).to have_content("City: Konya")
        end
      end
    end
  end
end
