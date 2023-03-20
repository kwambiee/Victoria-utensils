FactoryBot.define do
    factory :user do
        firstname { Faker::Name.first_name }
        lastname { Faker::Name.last_name }
        phone_number { Faker::PhoneNumber.phone_number }
        email_address { Faker::Internet.email }
        mailing_address { Faker::Address.full_address }
        password { Faker::Internet.password }
    end
end