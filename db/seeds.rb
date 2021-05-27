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

15.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true),
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone
  )
end

15.times do
  sample_owner_id = User.all.order("RANDOM()").limit(1)[0].id
  user = User.find(sample_owner_id)
  Car.create!(
    license_plate: Faker::Vehicle.singapore_license_plate,
    age: (1..15).to_a.sample,
    model: ["Compact", "Premium", "SUV", "Electric"].sample,
    brand: ["Toyata", "Honda", "Mitsubushi", "Tesla", "Mercedes", "Lexus"].sample,
    pickup_location: Faker::Address.street_address,
    rental_instructions: Faker::Movies::StarWars.quote,
    owner_id: user.id,
    image_urls: ["https://images.pexels.com/photos/4037760/pexels-photo-4037760.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", "https://images.pexels.com/photos/116675/pexels-photo-116675.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"].sample,
    price_per_hour: (15..20).to_a.sample
    )
  user.owner = true
  user.save!
end


car_one = Car.create(
  age: 5,
  license_plate: Faker::Vehicle.singapore_license_plate,
  model: "Cerato",
  brand: "KIA",
  pickup_location: Faker::Address.street_address,
  rental_instructions: Faker::Movies::StarWars.quote,
  owner_id: User.all.where(owner: true).order("RANDOM()").limit(1)[0].id,
  image_urls: "https://images.pexels.com/photos/4037760/pexels-photo-4037760.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
  )

car_two = Car.create(
  age: 7,
  license_plate: Faker::Vehicle.singapore_license_plate,
  model: "Sorento",
  brand: "KIA",
  pickup_location: Faker::Address.street_address,
  rental_instructions: Faker::Movies::StarWars.quote,
  owner_id: User.all.where(owner: true).order("RANDOM()").limit(1)[0].id,
  image_urls: "https://images.pexels.com/photos/6301929/pexels-photo-6301929.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
  )


15.times do
  CarReview.create!(
    review: Faker::Games::Dota.quote,
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
    car_id: Car.all.order("RANDOM()").limit(1)[0].id,
    user_id: User.all.order("RANDOM()").limit(1)[0].id
  )
end

