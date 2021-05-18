class RenterReview < ApplicationRecord
  belongs_to :car
  belongs_to :renter, class_name: "User", foreign_key: "renter"
  belongs_to :reviewer, class_name: "User", foreign_key: "reviewer"
end
