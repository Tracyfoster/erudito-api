FactoryBot.define do
  factory :course do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    subscription_level { :professional }
    instructor { Faker::Book.author }
    learning_module
  end

  factory :learning_module do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    industry { "Insurance" }
    professional_level { "advanced" }
  end

  factory :user do
    auth0_uid { Faker::Internet.uuid }
  end
end
