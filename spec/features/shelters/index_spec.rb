require "rails_helper"

RSpec.describe "shelters index page", type: :feature do
  it "can see the name of each shelter" do
    shelter1 = create(:shelter)
    shelter2 = create(:shelter)

    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end
