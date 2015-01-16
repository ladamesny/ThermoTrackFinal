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

ActiveRecord::Schema.define(version: 20150114233609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_lists", force: true do |t|
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.integer  "creator_id"
  end

  create_table "houses", force: true do |t|
    t.string   "name"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "readings", force: true do |t|
    t.integer  "fahrenheit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "thermometer_id"
  end

  create_table "thermometer_email_lists", force: true do |t|
    t.integer  "thermometer_id"
    t.integer  "email_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thermometers", force: true do |t|
    t.text    "name"
    t.text    "location"
    t.integer "curr_temp_fah"
    t.boolean "condition"
    t.integer "max_temp"
    t.integer "min_temp"
    t.boolean "readings_on"
    t.integer "house_id"
  end

  create_table "users", force: true do |t|
    t.text     "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.text     "name"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["email"], name: "users_email_key", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
