class Course < ApplicationRecord
  belongs_to :learning_module

  validates_presence_of :title, :subscription_level

  enum subscription_level: {
    basic: 0,
    premium: 1,
    professional: 2
  }

  def self.subscribed_courses(sub_type)
    case sub_type
    when "basic" then basic
    when "premium" then basic + premium
    else all
    end
  end
end
