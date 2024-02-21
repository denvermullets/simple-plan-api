class Coach < ApplicationRecord
  has_many :coach_student_bookings
  has_many :students, through: :coach_student_bookings
  has_many :coach_student_booking_reviews, through: :coach_student_bookings
end
