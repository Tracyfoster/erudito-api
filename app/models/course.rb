class Course < ApplicationRecord
  belongs_to :learning_module

  validates_presence_of :title, :subscription_level

  enum subscription_level: {
    basic: "basic",
    advanced: "advanced",
    professional: "professional"
  }
end
