require "rails_helper"

RSpec.describe Course, type: :model do
  let(:learning_module) { create(:learning_module) }

  describe "Validations" do
    let(:course) { create(:course, learning_module: learning_module) }

    it "has a valid factory" do
      expect(build(:course)).to be_valid
    end

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:subscription_level) }
  end
end
