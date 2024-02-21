class CreateCoachStudentBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :coach_student_bookings do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.date :date
      t.time :start_at
      t.time :end_at
      t.boolean :completed

      t.timestamps
    end
  end
end
