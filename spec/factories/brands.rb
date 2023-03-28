FactoryBot.define do
  factory :brand do
    name { Faker::Alphanumeric.alpha(number: 5) }
  end
end
