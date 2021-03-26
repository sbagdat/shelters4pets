# frozen_string_literal: true

require "rails_helper"

RSpec.describe "search by exact name", type: :feature do
  describe "as a visitor" do
    describe "shelters index" do
      it "can search shelters by exact name" do
        create(:shelter, name: "Kızılay Barınağı")
        create(:shelter, name: "Odunpazarı Barınağı")

        visit "/shelters"

        fill_in "Filter by name", with: "Kızılay Barınağı"
        check "Exact match"
        click_button "Filter"

        expect(page).to have_content("Kızılay Barınağı")
        expect(page).to_not have_content("Odunpazarı Barınağı")
      end

      it "can search shelters by partial name" do
        create(:shelter, name: "Kızılay Barınağı")
        create(:shelter, name: "Odunpazarı Barınağı")
        create(:shelter, name: "Merkez Barınak")

        visit "/shelters"

        fill_in "Filter by name", with: "barınağı"
        uncheck "Exact match"
        click_button "Filter"

        expect(page).to have_content("Kızılay Barınağı")
        expect(page).to have_content("Odunpazarı Barınağı")
        expect(page).to_not have_content("Merkez Barınak")
      end
    end

    describe "pets index" do
      it "can search pets by exact name" do
        shelter1 = create(:shelter)
        shelter1.pets.create(name: "Puppy", breed: "English", age: 5)
        shelter1.pets.create(name: "Fifi", breed: "French", age: 4)

        visit "/pets"

        fill_in "Filter by name", with: "puppy"
        uncheck "Exact match"
        click_button "Filter"

        expect(page).to have_content("Puppy")
        expect(page).to_not have_content("Fifi")
      end

      it "can search pets by partial name" do
        shelter1 = create(:shelter)
        shelter1.pets.create(name: "Puppy", breed: "English", age: 5)
        shelter1.pets.create(name: "Pupper", breed: "French", age: 4)
        shelter1.pets.create(name: "Bro", breed: "French", age: 4)

        visit "/pets"

        fill_in "Filter by name", with: "pup"
        uncheck "Exact match"
        click_button "Filter"

        expect(page).to have_content("Puppy")
        expect(page).to have_content("Pupper")
        expect(page).to_not have_content("Bro")
      end
    end
  end
end
