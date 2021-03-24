# frozen_string_literal: true

require "rails_helper"

RSpec.describe "search by exact name", type: :feature do
  describe "as a visitor" do
    describe "shelters index" do
      it "can search shelters by exact name" do
        create(:shelter, name: "Kızılay Barınağı")
        create(:shelter, name: "Odunpazarı Barınağı")

        visit "/shelters"

        within ".filter-by-exact-name" do
          fill_in "Exact name", with: "Kızılay Barınağı"
          click_button "Filter"
        end

        expect(page).to have_content("Kızılay Barınağı")
        expect(page).to_not have_content("Odunpazarı Barınağı")
      end

      it "can search shelters by exact name" do
        create(:shelter, name: "Kızılay Barınağı")
        create(:shelter, name: "Odunpazarı Barınağı")
        create(:shelter, name: "Merkez Barınak")

        visit "/shelters"

        within ".filter-by-partial-name" do
          fill_in "Partial name", with: "Barınağı"
          click_button "Filter"
        end

        expect(page).to have_content("Kızılay Barınağı")
        expect(page).to have_content("Odunpazarı Barınağı")
        expect(page).to_not have_content("Merkez Barınak")
      end
    end
  end
end
