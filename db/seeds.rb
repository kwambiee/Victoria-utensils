# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
    Category.create!(
        title: Faker::Appliance.equipment
        description: Faker::Lorem.paragraph(sentence_count: 2)
    )
end

5.times do
    Brand.create!(
        name: Faker::Appliance.brand
    )
end

10.times do
    Product.create!(
        title: Faker::
        image_url:
        description:
        price: 
    )
end