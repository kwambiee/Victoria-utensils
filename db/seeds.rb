# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
    Category.create!(
        title: Faker::Appliance.equipment,
        description: Faker::Lorem.paragraph(sentence_count: 2)
    )
end

5.times do
    Brand.create!(
        name: Faker::Appliance.brand
    )
end

20.times do
    Product.create!(
        title:  Faker::Alphanumeric.alpha(number: 10),
        price: Faker::Number.decimal(l_digits: 3, r_digits: 2) ,
        category_id: Category.all.pluck(:id).sample,
        brand_id: Brand.all.pluck(:id).sample
    )
end

10.times do
    User.create!(
        firstname:  Faker::Name.first_name ,
        lastname:  Faker::Name.last_name ,
        phone_number:  Faker::PhoneNumber.phone_number ,
        mailing_address:  Faker::Internet.email ,
        email_address:  Faker::Internet.email ,
        password:  Faker::Internet.password 
    )
end

5.times do
    Wishlist.create!(
        user_id: User.all.pluck(:id).sample,
        product_id: Product.all.pluck(:id).sample
    )
end