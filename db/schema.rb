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

ActiveRecord::Schema.define(version: 2021_05_22_043721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "status"
    t.bigint "car_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_bookings_on_car_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "car_reviews", force: :cascade do |t|
    t.text "review"
    t.bigint "car_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_car_reviews_on_car_id"
    t.index ["user_id"], name: "index_car_reviews_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "license_plate"
    t.integer "age"
    t.string "model"
    t.string "brand"
    t.string "pickup_location"
    t.string "rental_instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image_urls"
    t.bigint "owner_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["owner_id"], name: "index_cars_on_owner_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_favorites_on_car_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "renter_reviews", force: :cascade do |t|
    t.text "review"
    t.bigint "car_id", null: false
    t.bigint "renter_id"
    t.bigint "reviewer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_renter_reviews_on_car_id"
    t.index ["renter_id"], name: "index_renter_reviews_on_renter_id"
    t.index ["reviewer_id"], name: "index_renter_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "address"
    t.string "phone"
    t.boolean "owner", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "cars"
  add_foreign_key "bookings", "users"
  add_foreign_key "car_reviews", "cars"
  add_foreign_key "car_reviews", "users"
  add_foreign_key "cars", "users", column: "owner_id"
  add_foreign_key "favorites", "cars"
  add_foreign_key "favorites", "users"
  add_foreign_key "renter_reviews", "cars"
  add_foreign_key "renter_reviews", "users", column: "renter_id"
  add_foreign_key "renter_reviews", "users", column: "reviewer_id"
end
