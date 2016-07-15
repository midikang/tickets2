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

ActiveRecord::Schema.define(version: 20160715062759) do

  create_table "addresses", force: :cascade do |t|
    t.string   "kind"
    t.string   "street"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "article_categories", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "article_categories", ["article_id"], name: "index_article_categories_on_article_id"
  add_index "article_categories", ["category_id"], name: "index_article_categories_on_category_id"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_contents", force: :cascade do |t|
    t.text     "content"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.integer  "view_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charges", force: :cascade do |t|
    t.string   "carrier_account"
    t.string   "freight_term"
    t.integer  "estimated_shipment_charge"
    t.integer  "actual_shipment_charge"
    t.integer  "freight_charge"
    t.integer  "shipment_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "departure"
    t.datetime "arrival"
    t.string   "destination"
    t.decimal  "baggage_allowance"
    t.integer  "capacity"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer  "menu_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "flight_id"
    t.string   "name"
    t.decimal  "baggage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipment_lines", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "line_no"
    t.string   "item_id"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.string   "customer_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
