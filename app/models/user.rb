class User < ApplicationRecord
  validates_presence_of :auth0_uid

  enum subscription_type: {
    basic: "basic",
    premium: "premium",
    professional: "professional"
  }
end
