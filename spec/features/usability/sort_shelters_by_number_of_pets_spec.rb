# frozen_string_literal: true

require "rails_helper"

RSpec.describe "sort shelters by number of pets ", type: :feature do
  describe "as a visitor" do
    describe "shelters index link" do
      it "can sort shelters in ascending order" do
        shelter1 = create(:shelter) do |shelter|
          create_list(:pet, 3, shelter: shelter)
        end
        shelter2 = create(:shelter) do |shelter|
          create_list(:pet, 1, shelter: shelter)
        end
        shelter3 = create(:shelter) do |shelter|
          create_list(:pet, 5, shelter: shelter)
        end

        visit "/shelters"

        click_button "Ascending"
        within ".shelters li:first-child" do
          expect(page).to have_content(shelter2.name)
          expect(page).to have_content(shelter2.pets.count)
        end

        within ".shelters li:nth-child(2)" do
          expect(page).to have_content(shelter1.name)
          expect(page).to have_content(shelter1.pets.count)
        end

        within ".shelters li:last-child" do
          expect(page).to have_content(shelter3.name)
          expect(page).to have_content(shelter3.pets.count)
        end
      end

      it "can sort shelters in descending order" do
        shelter1 = create(:shelter) do |shelter|
          create_list(:pet, 3, shelter: shelter)
        end
        shelter2 = create(:shelter) do |shelter|
          create_list(:pet, 1, shelter: shelter)
        end
        shelter3 = create(:shelter) do |shelter|
          create_list(:pet, 5, shelter: shelter)
        end

        visit "/shelters"

        click_button "Descending"

        within ".shelters li:first-child" do
          expect(page).to have_content(shelter3.name)
          expect(page).to have_content(shelter3.pets.count)
        end

        within ".shelters li:nth-child(2)" do
          expect(page).to have_content(shelter1.name)
          expect(page).to have_content(shelter1.pets.count)
        end

        within ".shelters li:last-child" do
          expect(page).to have_content(shelter2.name)
          expect(page).to have_content(shelter2.pets.count)
        end
      end
    end
  end
end
