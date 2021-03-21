# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shelters index page", type: :feature do
  describe "As a visitor" do
    it "can see the name of each shelter" do
      shelter1 = create(:shelter)
      shelter2 = create(:shelter)

      visit "/shelters"

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
    end

    it "can see shelters ordered by most recently first" do
      shelter1 = create(:shelter)
      shelter2 = create(:shelter)
      shelter3 = create(:shelter)

      visit "/shelters"

      within "ul.shelters > li:first-child" do
        expect(page).to have_content(shelter3.name)
        expect(page).to have_content(shelter3.created_at)
      end

      within "ul.shelters > li:nth-child(2)" do
        expect(page).to have_content(shelter2.name)
        expect(page).to have_content(shelter2.created_at)
      end

      within "ul.shelters > li:last-child" do
        expect(page).to have_content(shelter1.name)
        expect(page).to have_content(shelter1.created_at)
      end
    end
  end
end
