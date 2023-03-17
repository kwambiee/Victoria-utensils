FactoryBot.define do
    factory :user do
        firstname { Faker::Name.first_name }
        lastname { Faker::Name.last_name }
        phone_number { Faker::PhoneNumber.phone_number }
        mailing_address { Faker::Internet.email }
        email_address { Faker::Internet.email }
        password { Faker::Internet.password }
    end
end