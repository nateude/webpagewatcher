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

ActiveRecord::Schema.define(version: 20170125231246) do

  create_table "tests", force: :cascade do |t|
    t.integer  "load_time"
    t.integer  "first_byte"
    t.integer  "start_render"
    t.integer  "speed_index"
    t.integer  "dom_elements"
    t.integer  "complete_time"
    t.integer  "complete_requests"
    t.integer  "complete_bytes_in"
    t.integer  "loaded_time"
    t.integer  "loaded_requests"
    t.integer  "loaded_bytes_in"
    t.integer  "loaded_certificates"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "status"
    t.string   "wpt_id"
    t.string   "url"
  end

  create_table "websites", force: :cascade do |t|
    t.string   "url"
    t.string   "name"
    t.string   "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end