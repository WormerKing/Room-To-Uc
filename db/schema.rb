# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_23_200410) do

  create_table "rooms", force: :cascade do |t|
    t.text "rules", null: false
    t.boolean "online", null: false
    t.integer "room_id", null: false
    t.string "password", null: false
    t.integer "winner_id"
    t.integer "creator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tip"
    t.string "title"
    t.datetime "last_activity_at"
    t.index ["creator_id"], name: "index_rooms_on_creator_id"
    t.index ["winner_id"], name: "index_rooms_on_winner_id"
  end

  create_table "rooms_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.index ["room_id"], name: "index_rooms_users_on_room_id"
    t.index ["user_id"], name: "index_rooms_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "role", null: false
    t.integer "pubg_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "rooms", "users", column: "creator_id"
  add_foreign_key "rooms", "users", column: "winner_id"
end
