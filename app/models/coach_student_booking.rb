class CoachStudentBooking < ApplicationRecord
  belongs_to :coach
  belongs_to :student, optional: true

  has_many :coach_student_booking_reviews

  scope :available_sessions, ->(date) { where(date: Time.zone.parse(date)..Time.zone.parse(date) + 30.days, student_id: nil) }
end
