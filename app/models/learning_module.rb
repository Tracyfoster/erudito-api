class LearningModule < ApplicationRecord
  validates_presence_of :title, :industry, :professional_level

  enum professional_level: {
    beginner: "beginner",
    advanced: "advanced",
    expert: "expert"
  }
end
