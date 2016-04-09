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

ActiveRecord::Schema.define(version: 20160409142442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "restaurant_id"
    t.integer  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "basket_items", ["item_id"], name: "index_basket_items_on_item_id", using: :btree
  add_index "basket_items", ["restaurant_id"], name: "index_basket_items_on_restaurant_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_options", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourite_farms", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favourite_farms", ["farm_id"], name: "index_favourite_farms_on_farm_id", using: :btree
  add_index "favourite_farms", ["restaurant_id"], name: "index_favourite_farms_on_restaurant_id", using: :btree

  create_table "item_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "item_images", ["item_id"], name: "index_item_images_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "price"
    t.integer  "farm_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "archived"
    t.text     "description"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "line_items", ["item_id"], name: "index_line_items_on_item_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.decimal  "total_ex_vat"
    t.float    "vat",                default: 20.0
    t.integer  "delivery_option_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["delivery_option_id"], name: "index_orders_on_delivery_option_id", using: :btree
  add_index "orders", ["status_id"], name: "index_orders_on_status_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "type"
    t.string   "street"
    t.string   "city"
    t.string   "post_code"
    t.string   "region"
    t.text     "logo"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "basket_items", "items"
  add_foreign_key "item_images", "items"
  add_foreign_key "line_items", "items"
  add_foreign_key "line_items", "orders"
  add_foreign_key "orders", "delivery_options"
  add_foreign_key "orders", "statuses"
end
