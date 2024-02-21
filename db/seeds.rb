# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

coach_one = Coach.create(first_name: 'Adam', last_name: 'Smith', slug: 'coach' )
coach_two = Coach.create(first_name: 'Jason', last_name: 'Sudeakis', slug: 'coach' )
student_one = Student.create(first_name: 'Jamie', last_name: 'Lannister', slug: 'student')
student_two = Student.create(first_name: 'Tyrion', last_name: 'Lannister', slug: 'student')

booking_one = CoachStudentBooking.create(coach: coach_one, student: student_two)
booking_two = CoachStudentBooking.create(coach: coach_two, student: student_one)

session_review = CoachStudentBookingReview.create(coach_student_booking: booking_one, score: 5)