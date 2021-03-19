require "rails_helper"

RSpec.describe Pet, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:breed) }
    it { should validate_numericality_of(:age).only_integer }
  end
end
