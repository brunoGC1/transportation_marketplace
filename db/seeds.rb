# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.create(email: "carlos@carlos.com", password: "123456")


5.times do
  transportation = Transportation.create(
    brand: Faker::Vehicle.manufacture,
    brand_model: Faker::Vehicle.model,
    price: Faker::Number.number(digits: 8),
    user_id: User.first.id
  )
  puts "Transportation with id: #{transportation.id} has been created"
end
