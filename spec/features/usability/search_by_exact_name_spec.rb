# frozen_string_literal: true

require "rails_helper"

RSpec.describe "search by exact name", type: :feature do
  describe "as a visitor" do
    describe "shelters index" do
      it "can search shelters by exact name" do
        create(:shelter, name: "Kızılay Barınağı")
        create(:shelter, name: "Odunpazarı Barınağı")

        visit "/shelters"

        fill_in "Exact name", with: "Kızılay Barınağı"
        click_button "Filter"

        expect(page).to have_content("Kızılay Barınağı")
        expect(page).to_not have_content("Odunpazarı Barınağı")
      end
    end
  end
end
