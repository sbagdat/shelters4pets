# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shelter show page", type: :feature do
  it "can see all information about that specific shelter" do
    shelter = create(:shelter)

    visit "shelters/#{shelter.id}"

    expect(page).to have_content(shelter.name)
    expect(page).to have_content(shelter.city)
    expect(page).to have_content(shelter.rank)
  end
end
