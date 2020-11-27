FactoryBot.define do
  factory :course do
    title { "Negotiating Like a Pro" }
    description { Faker::Lorem.paragraph }
    subscription_level { :professional }
    instructor { "Flemming Martins" }
    learning_module
  end

  factory :learning_module do
    title { "Advanced Tutorial" }
    description { Faker::Lorem.paragraph }
    industry { "Insurance" }
    professional_level { "advanced" }
  end

  factory :user do
    auth0_uid { Faker::Internet.uuid }
  end
end
