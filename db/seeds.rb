# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Clear existing data
Review.destroy_all
Restaurant.destroy_all

# Create valid restaurant records using Faker
puts "Creating new restaurants..."
10.times do
  name = Faker::Restaurant.name
  address = Faker::Address.street_address
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  phone_number = Faker::PhoneNumber.phone_number

  restaurant = Restaurant.create!(
    name: name,
    address: address,
    category: category,
    phone_number: phone_number
  )

  # Create reviews for each restaurant
  5.times do
    content = Faker::Lorem.paragraph(sentence_count: 3)
    rating = rand(0..5)

    restaurant.reviews.create!(
      content: content,
      rating: rating
    )
  end
end

puts "Seeded restaurants and reviews using Faker"
