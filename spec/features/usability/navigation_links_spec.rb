require "rails_helper"

RSpec.describe "navigation links", type: :feature do
  describe "as a visitor" do
    describe "shelters index link" do
      it "can see a link to shelters index at every page" do
        visit "/"

        expect(page).to have_link("Shelters", href: "/shelters")
      end
    end

    describe "pets index link" do
      it "can see a link to shelters index at every page" do
        visit "/shelters"

        expect(page).to have_link("Pets", href: "/pets")
      end
    end

    describe "shelter's pets link" do
      it "can see a link to shelters index at every page" do
        shelter1 = create(:shelter) do |shelter|
          create_list(:pet, 1, shelter: shelter)
        end

        visit "/shelters/#{shelter1.id}"

        expect(page).to have_link("Show Pets", href: "/shelters/#{shelter1.id}/pets")
      end
    end

  end
end
