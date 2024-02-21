class CoachStudentBooking < ApplicationRecord
  belongs_to :coach
  belongs_to :student

  has_many :coach_student_booking_reviews
end
