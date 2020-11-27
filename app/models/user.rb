class User < ApplicationRecord
  validates_presence_of :auth0_uid

  enum subscription_type: {
    basic: "basic",
    premium: "premium",
    professional: "professional"
  }

  def self.from_token_payload(payload)
    key_to_find = Rails.env.test? ? :id : :auth0_uid
    self.find_by(key_to_find => payload["sub"])
  end
end
