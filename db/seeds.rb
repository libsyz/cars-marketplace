# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.destroy_all
User.destroy_all
CarReview.destroy_all
RenterReview.destroy_all
Favorite.destroy_all


car_one = Car.create(
  age: "5 years",
  license_plate: Faker::Address.zip,
  model: "Cerato",
  brand: "KIA",
  image_urls: "https://images.pexels.com/photos/4037760/pexels-photo-4037760.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
  )

car_two = Car.create(
  age: "7 years",
  license_plate: Faker::Address.zip,
  model: "Sorento",
  brand: "KIA",
  image_urls: "https://images.pexels.com/photos/6301929/pexels-photo-6301929.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
  )


15.times do
  Car.create!(
    license_plate: Faker::Address.zip,
    age: [1..15].sample,
    model: ["Compact", "Premium", "SUV", "Electric"].sample,
    brand: ["Toyata", "Honda", "Mitsubushi", "Tesla", "Mercedes", "Lexus"].sample,
    pickup_location: Faker::Address.street_address
  )
end

15.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true),
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone
  )
end

User.all.sample(5).each { |user| user.owner = true }

15.times do
  CarReview.create!(
    review: Faker::Marketing.buzzwords,
    car_id: Car.all.order("RANDOM()").limit(1)[0].id,
    user_id: User.all.order("RANDOM()").limit(1)[0].id
  )
end

15.times do
  sample_id = User.all.order("RANDOM()").limit(1)[0].id
  RenterReview.create!(
    review: Faker::Movie.quote,
    car_id: Car.all.order("RANDOM()").limit(1)[0].id,
    renter_id: sample_id,
    reviewer_id: User.all.where.not(id: sample_id).order("RANDOM()").limit(1)[0].id
  )
end

15.times do
  Favorite.create!(
    car_id: [1..15].sample,
    user_id: [1..5].sample
  )
end

