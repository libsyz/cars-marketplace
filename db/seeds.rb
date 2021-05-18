# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do
  Car.create(
    license_plate: Faker::Address.zip,
    age: [1..15].sample,
    model: ["Compact", "Premium", "SUV", "Electric"].sample,
    brand: ["Toyata", "Honda", "Mitsubushi", "Tesla", "Mercedes", "Lexus"].sample,
    pickup_location: Faker::Address.street_address
  )
end
