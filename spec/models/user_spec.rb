require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    let(:user) { create(:user) }

    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end

    it { is_expected.to validate_presence_of(:auth0_uid) }
  end
end
