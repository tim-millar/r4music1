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

ActiveRecord::Schema.define(version: 20170208130501) do

  create_table "composers", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "editions", force: :cascade do |t|
    t.string   "description",  limit: 255
    t.integer  "year",         limit: 4
    t.float    "price",        limit: 24
    t.integer  "work_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "publisher_id", limit: 4
    t.string   "title",        limit: 255
  end

  add_index "editions", ["publisher_id"], name: "index_editions_on_publisher_id", using: :btree
  add_index "editions", ["work_id"], name: "index_editions_on_work_id", using: :btree

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
  end

  add_index "works", ["composer_id"], name: "index_works_on_composer_id", using: :btree

  add_foreign_key "editions", "publishers"
  add_foreign_key "editions", "works"
  add_foreign_key "works", "composers"
end
