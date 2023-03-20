FactoryBot.define do
  factory :category do
    title { Faker::Alphanumeric.alpha(number: 10) }
    description { "My Description" }
  end
end
