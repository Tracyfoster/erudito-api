class User < ApplicationRecord
  validates_presence_of :auth0_uid

  enum subscription_type: {
    basic: 0,
    premium: 1,
    professional: 2
  }

  def self.from_token_payload(payload)
    key_to_find = Rails.env.test? ? :id : :auth0_uid
    find_by(key_to_find => payload["sub"])
  end

  def enrollable_courses
    Course.subscribed_courses(subscription_type)
  end
end
