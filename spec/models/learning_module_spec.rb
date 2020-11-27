require "rails_helper"

RSpec.describe LearningModule, type: :model do
  describe "Validations" do
    let(:learning_module) { create(:learning_module) }

    it "has a valid factory" do
      expect(build(:learning_module)).to be_valid
    end

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:industry) }
    it { is_expected.to validate_presence_of(:professional_level) }
  end
end
