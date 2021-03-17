require "rails_helper"

RSpec.describe Shelter, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:rank) }
    it { should validate_numericality_of(:rank).only_integer }
    it { should validate_presence_of(:city) }
  end
end
