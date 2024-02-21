# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

start_at = Time.new(Time.now.year, Time.now.month, Time.now.day, 10, 0)

coach_one = Coach.create(first_name: 'Adam', last_name: 'Smith', slug: 'coaches' )
coach_two = Coach.create(first_name: 'Jason', last_name: 'Sudeakis', slug: 'coaches' )
student_one = Student.create(first_name: 'Jamie', last_name: 'Lannister', slug: 'students')
student_two = Student.create(first_name: 'Tyrion', last_name: 'Lannister', slug: 'students')

booking_one = CoachStudentBooking.create(
  coach: coach_one, student: student_two, date: Date.today, start_at:, end_at: start_at + 2.hours
)
booking_two = CoachStudentBooking.create(
  coach: coach_two, student: student_one, date: Date.today, start_at:, end_at: start_at + 2.hours
)

session_review = CoachStudentBookingReview.create(coach_student_booking: booking_one, score: 5)