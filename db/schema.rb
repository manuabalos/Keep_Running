# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150610081407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "histories", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "user_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "histories", ["route_id"], name: "index_histories_on_route_id", using: :btree
  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "location"
    t.string   "difficulty"
    t.float    "distance"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "origin_lat"
    t.float    "origin_lng"
    t.float    "destination_lat"
    t.float    "destination_lng"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "provider"
    t.text     "photo"
    t.integer  "age",        default: 27
    t.text     "location",   default: "Madrid"
    t.integer  "level",      default: 1
    t.integer  "experience", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "waypoints", force: :cascade do |t|
    t.integer  "route_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
