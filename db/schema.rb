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

ActiveRecord::Schema.define(version: 20180427090939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "theaters", force: :cascade do |t|
    t.string "theater_name"
    t.string "location"
    t.string "manager"
    t.string "manager_phone"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "last_sign_in_at"
    t.integer  "status",          default: 0
    t.string   "provider"
    t.string   "uid"
    t.string   "address"
    t.string   "cell_phone_nr"
    t.string   "photo_url"
    t.integer  "role",            default: 0
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

end
