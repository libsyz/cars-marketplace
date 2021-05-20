class Car < ApplicationRecord
  has_many :car_reviews, dependent: :delete_all
  has_many :renter_reviews, dependent: :delete_all
  has_many :bookings, dependent: :delete_all
  has_many :favorites, dependent: :delete_all
  has_many :users, through: :bookings
  has_many :users_favorite, through: :favorites, class_name: "User"
end
