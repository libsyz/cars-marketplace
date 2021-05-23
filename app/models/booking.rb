class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validate :end_date_after_start_date?

  # private

  # def end_date_after_start_date?
  #   if end_date < start_date
  #     errors.add :end_date, "must be after start date"
  #   end
  # end
end
