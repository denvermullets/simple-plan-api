class CoachStudentBooking < ApplicationRecord
  belongs_to :coach
  belongs_to :student, optional: true

  has_many :coach_student_booking_reviews
end
