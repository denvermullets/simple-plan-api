class CreateCoachStudentBookingReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :coach_student_booking_reviews do |t|
      t.references :coach_student_booking, null: false, foreign_key: true
      t.integer :score
      t.text :notes

      t.timestamps
    end
  end
end
