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

ActiveRecord::Schema.define(version: 20170512181538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_participants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "chat_id"
    t.integer  "user_id"
  end

  add_index "chat_participants", ["chat_id"], name: "index_chat_participants_on_chat_id", using: :btree
  add_index "chat_participants", ["user_id"], name: "index_chat_participants_on_user_id", using: :btree

  create_table "chats", force: :cascade do |t|
    t.string   "Theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controllers", force: :cascade do |t|
    t.string   "Instruments"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_to_genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.integer  "genre_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "information"
    t.string   "city_name"
    t.string   "state_name"
    t.string   "country_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "instrumentalist_to_groups", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "instrumentalist_id"
    t.integer  "group_id"
  end

  create_table "instrumentalists", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "instrument_id"
  end

  add_index "instrumentalists", ["instrument_id"], name: "index_instrumentalists_on_instrument_id", using: :btree
  add_index "instrumentalists", ["user_id"], name: "index_instrumentalists_on_user_id", using: :btree

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text"
    t.string   "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "chat_id"
    t.integer  "user_id"
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "resume_genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "resume_id"
    t.integer  "genre_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "instrumentalist_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "information"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "genre_id"
  end

  add_index "user_genres", ["genre_id"], name: "index_user_genres_on_genre_id", using: :btree
  add_index "user_genres", ["user_id"], name: "index_user_genres_on_user_id", using: :btree

  create_table "user_to_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "role_id"
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
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "date_of_birth"
    t.text     "info"
    t.integer  "gender_id"
    t.string   "country_name"
    t.string   "city_name"
    t.string   "state_name"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["gender_id"], name: "index_users_on_gender_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "chat_participants", "chats"
  add_foreign_key "chat_participants", "users"
  add_foreign_key "group_to_genres", "genres"
  add_foreign_key "group_to_genres", "groups"
  add_foreign_key "instrumentalist_to_groups", "groups"
  add_foreign_key "instrumentalist_to_groups", "instrumentalists"
  add_foreign_key "instrumentalists", "instruments"
  add_foreign_key "instrumentalists", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "resume_genres", "genres"
  add_foreign_key "resume_genres", "resumes"
  add_foreign_key "resumes", "instrumentalists"
  add_foreign_key "user_genres", "genres"
  add_foreign_key "user_genres", "users"
  add_foreign_key "user_to_groups", "groups"
  add_foreign_key "user_to_groups", "roles"
  add_foreign_key "user_to_groups", "users"
  add_foreign_key "users", "genders"
  add_foreign_key "users", "roles"
end
