class LearningModule < ApplicationRecord
  has_many :courses, dependent: :destroy
  validates_presence_of :title, :industry, :professional_level

  enum professional_level: {
    beginner: "beginner",
    advanced: "advanced",
    expert: "expert"
  }
end
