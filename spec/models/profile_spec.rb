require "rails_helper"

RSpec.describe Profile, type: :model do
  describe "Validations" do
    let(:profile) { create(:profile) }

    it "has a valid factory" do
      expect(build(:profile)).to be_valid
    end

    it { is_expected.to validate_presence_of(:auth0_uid) }
  end
end
