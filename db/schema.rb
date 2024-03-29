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

ActiveRecord::Schema.define(version: 20140329174638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identities", force: true do |t|
    t.string   "type",        null: false
    t.integer  "user_id",     null: false
    t.string   "uid",         null: false
    t.string   "auth_token",  null: false
    t.string   "auth_secret"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "identities", ["type", "uid"], name: "index_identities_on_type_and_uid", unique: true, using: :btree
  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "sources", force: true do |t|
    t.string   "type",       null: false
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.string   "locator",    null: false
    t.string   "web_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "synced_at"
  end

  add_index "sources", ["user_id", "locator"], name: "index_sources_on_user_id_and_locator", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
