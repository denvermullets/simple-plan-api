class CreateCoachStudentBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :coach_student_bookings do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :student, null: true, foreign_key: true
      t.datetime :date
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
