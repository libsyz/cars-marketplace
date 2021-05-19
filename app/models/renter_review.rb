class RenterReview < ApplicationRecord
  belongs_to :car
  belongs_to :renter, class_name: "User"
  belongs_to :reviewer, class_name: "User"
end
