# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Reservation.destroy_all
Transportation.destroy_all
User.destroy_all
User.create(email: "aaaa@gmail.com", password: "123456")

transportation = Transportation.create(
  brand: Faker::Vehicle.manufacture,
  brand_model: Faker::Vehicle.model,
  price: Faker::Number.number(digits: 8),
  user_id: User.first.id)

5.times do
  reservation = Reservation.create(
    start_date: Date.today,
    end_date: Date.tomorrow,
    total_price: 100,
    user_id: User.first.id,
    transportation_id: Transportation.first.id)

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
