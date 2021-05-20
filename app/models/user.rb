class User < ApplicationRecord
  has_many :car_reviews, dependent: :delete_all
  has_many :renter, class_name: "RenterReview"
  has_many :reviewer, class_name: "RenterReview"
  has_many :bookings, dependent: :delete_all
  has_many :favorites, dependent: :delete_all
  has_many :cars, through: :bookings
  has_many :cars, through: :favorites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
