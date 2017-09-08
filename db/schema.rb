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

ActiveRecord::Schema.define(version: 20170908095814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announce_users", force: :cascade do |t|
    t.bigint "announce_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announce_id"], name: "index_announce_users_on_announce_id"
    t.index ["user_id"], name: "index_announce_users_on_user_id"
  end

  create_table "announces", force: :cascade do |t|
    t.string "title"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "todo_id"
    t.text "text"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_comments_on_todo_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "text"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "demo"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.boolean "banned"
    t.string "code"
    t.string "phone"
    t.boolean "send_sms", default: false
    t.boolean "send_email", default: false
  end

  add_foreign_key "announce_users", "announces"
  add_foreign_key "announce_users", "users"
  add_foreign_key "comments", "todos"
  add_foreign_key "todos", "users"
end
