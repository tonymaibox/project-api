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

ActiveRecord::Schema.define(version: 20161010142852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "days", force: :cascade do |t|
    t.integer  "day"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "itinerary_id"
    t.index ["itinerary_id"], name: "index_days_on_itinerary_id", using: :btree
  end

  create_table "days_locations", force: :cascade do |t|
    t.integer  "day_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["day_id"], name: "index_days_locations_on_day_id", using: :btree
    t.index ["location_id"], name: "index_days_locations_on_location_id", using: :btree
  end

  create_table "itineraries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "upvotes",    default: 0
  end

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_activities", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_locations_activities_on_activity_id", using: :btree
    t.index ["location_id"], name: "index_locations_activities_on_location_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_itineraries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "itinerary_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["itinerary_id"], name: "index_users_itineraries_on_itinerary_id", using: :btree
    t.index ["user_id"], name: "index_users_itineraries_on_user_id", using: :btree
  end

  add_foreign_key "days", "itineraries"
  add_foreign_key "days_locations", "days"
  add_foreign_key "days_locations", "locations"
  add_foreign_key "locations_activities", "activities"
  add_foreign_key "locations_activities", "locations"
  add_foreign_key "users_itineraries", "itineraries"
  add_foreign_key "users_itineraries", "users"
end
