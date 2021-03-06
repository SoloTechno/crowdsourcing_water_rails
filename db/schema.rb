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

ActiveRecord::Schema.define(version: 20170416165712) do

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "account_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "water_purity_reports", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "reporter_name"
    t.string   "location"
    t.decimal  "lat",             precision: 25, scale: 20
    t.decimal  "lng",             precision: 25, scale: 20
    t.integer  "water_condition"
    t.decimal  "virus_ppm"
    t.decimal  "contaminant_ppm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "water_source_reports", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "reporter_name"
    t.string   "location"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "water_condition"
    t.integer  "water_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
