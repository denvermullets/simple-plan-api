# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_21_110137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coach_student_booking_reviews", force: :cascade do |t|
    t.bigint "coach_student_booking_id", null: false
    t.integer "score"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_student_booking_id"], name: "idx_on_coach_student_booking_id_8553c55c42"
  end

  create_table "coach_student_bookings", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.bigint "student_id", null: false
    t.date "date"
    t.time "start_at"
    t.time "end_at"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_coach_student_bookings_on_coach_id"
    t.index ["student_id"], name: "index_coach_student_bookings_on_student_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coach_student_booking_reviews", "coach_student_bookings"
  add_foreign_key "coach_student_bookings", "coaches"
  add_foreign_key "coach_student_bookings", "students"
end
