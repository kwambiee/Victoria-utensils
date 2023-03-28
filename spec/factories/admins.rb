FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { "MyString" }
  end
end
