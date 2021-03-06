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

ActiveRecord::Schema.define(version: 20170302233847) do

  create_table "composers", force: :cascade do |t|
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "middle_name", limit: 255
    t.date     "birth_year"
    t.date     "death_year"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "nick",       limit: 255
    t.string   "password",   limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "editions", force: :cascade do |t|
    t.string   "description",  limit: 255
    t.integer  "year",         limit: 4
    t.float    "price",        limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "publisher_id", limit: 4
    t.string   "title",        limit: 255
  end

  add_index "editions", ["publisher_id"], name: "index_editions_on_publisher_id", using: :btree

  create_table "editions_works", id: false, force: :cascade do |t|
    t.integer "edition_id", limit: 4, null: false
    t.integer "work_id",    limit: 4, null: false
  end

  add_index "editions_works", ["edition_id", "work_id"], name: "index_editions_works_on_edition_id_and_work_id", using: :btree
  add_index "editions_works", ["work_id", "edition_id"], name: "index_editions_works_on_work_id_and_edition_id", using: :btree

  create_table "instruments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "family",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "instruments_works", id: false, force: :cascade do |t|
    t.integer "instrument_id", limit: 4
    t.integer "work_id",       limit: 4
  end

  add_index "instruments_works", ["instrument_id"], name: "index_instruments_works_on_instrument_id", using: :btree
  add_index "instruments_works", ["work_id"], name: "index_instruments_works_on_work_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "edition_id",  limit: 4
    t.integer  "customer_id", limit: 4
    t.string   "status",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["edition_id"], name: "index_orders_on_edition_id", using: :btree

  create_table "publishers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "city",       limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "works", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "composer_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "kee",         limit: 255
    t.string   "opus",        limit: 255
    t.integer  "year",        limit: 4
  end

  add_index "works", ["composer_id"], name: "index_works_on_composer_id", using: :btree

  add_foreign_key "editions", "publishers"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "editions"
  add_foreign_key "works", "composers"
end
