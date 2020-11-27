FactoryBot.define do
  factory :learning_module do
    title { "Advanced Turorial" }
    description { Faker::Lorem.paragraph }
    industry { "Insurance" }
    professional_level { "advanced" }
  end

  factory :user do
    auth0_uid { Faker::Internet.uuid }
  end
end
