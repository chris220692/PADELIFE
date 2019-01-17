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

ActiveRecord::Schema.define(version: 2019_01_17_100514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.integer "street_number"
    t.string "city"
    t.integer "zip"
    t.text "description"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.boolean "outdoor", default: true
    t.integer "price"
    t.string "status", default: "Free"
    t.integer "field_number"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_fields_on_club_id"
  end

  create_table "player_reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_reviews_on_player_id"
    t.index ["user_id"], name: "index_player_reviews_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.text "description"
    t.string "level"
    t.string "photo"
    t.string "city"
    t.integer "zip"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "teacher_reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_teacher_reviews_on_teacher_id"
    t.index ["user_id"], name: "index_teacher_reviews_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.integer "age"
    t.string "photo"
    t.string "city"
    t.integer "zip"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clubs", "users"
  add_foreign_key "fields", "clubs"
  add_foreign_key "player_reviews", "players"
  add_foreign_key "player_reviews", "users"
  add_foreign_key "players", "users"
  add_foreign_key "teacher_reviews", "teachers"
  add_foreign_key "teacher_reviews", "users"
  add_foreign_key "teachers", "users"
end
