# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191209053357) do

  create_table "applicationforms", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "schedule"
    t.string "courses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "course_number"
    t.integer "section_number"
    t.integer "start_time"
    t.integer "end_time"
    t.string "days"
    t.boolean "is_offered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grader_applications", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "courses"
    t.string "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lecture_section"
    t.integer "lab_section"
    t.integer "recommandations_id"
    t.integer "osu_id"
    t.integer "status", default: 0
    t.integer "user_id"
    t.index ["user_id"], name: "index_grader_applications_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "instructor_osu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labs", force: :cascade do |t|
    t.integer "parent_section_number"
    t.integer "section_number"
    t.string "days"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lectures", force: :cascade do |t|
    t.integer "course_number"
    t.integer "section_number"
    t.string "day"
    t.string "time"
    t.string "teacher"
    t.boolean "has_lab"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommandations", force: :cascade do |t|
    t.integer "teacher_id"
    t.boolean "recommanded"
    t.string "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_teacher"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
