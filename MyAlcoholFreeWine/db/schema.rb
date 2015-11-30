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

ActiveRecord::Schema.define(version: 20151130142600) do

  create_table "customers", force: :cascade do |t|
    t.string   "firstname",  null: false
    t.string   "surname",    null: false
    t.string   "address",    null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wines", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "suitable_for_vegetarians"
    t.string   "bottle_size"
    t.string   "country_of_origin"
    t.string   "grape_type"
    t.string   "supplier"
    t.decimal  "price"
    t.string   "image_url"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "product_number"
  end

end
