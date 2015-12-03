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

ActiveRecord::Schema.define(version: 20151203181701) do

  create_table "basket_items", force: :cascade do |t|
    t.integer  "wine_id"
    t.integer  "basket_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  add_index "basket_items", ["basket_id"], name: "index_basket_items_on_basket_id"
  add_index "basket_items", ["order_id"], name: "index_basket_items_on_order_id"
  add_index "basket_items", ["wine_id"], name: "index_basket_items_on_wine_id"

  create_table "baskets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_details", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["email"], name: "index_customers_on_email"

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
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
