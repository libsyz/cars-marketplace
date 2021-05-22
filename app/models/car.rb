class Car < ApplicationRecord
  has_many :car_reviews, dependent: :delete_all
  has_many :renter_reviews, dependent: :delete_all
  has_many :bookings, dependent: :delete_all
  has_many :favorites, dependent: :delete_all
  has_many :users, through: :bookings
  has_many :users_favorite, through: :favorites, class_name: "User"
  belongs_to :owner, class_name: "User"

  validates :license_plate, presence: true, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 0 }
  validates :brand, presence: true
  validates :model, presence: true
  validates :pickup_location, presence: true
  validates :rental_instructions, presence: true

  geocoded_by :pickup_location
  after_validation :geocode, if: :will_save_change_to_pickup_location?
end
