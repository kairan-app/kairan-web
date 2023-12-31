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

ActiveRecord::Schema[7.1].define(version: 2023_12_01_121509) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_passwords", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token", null: false
    t.datetime "last_used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_app_passwords_on_token", unique: true
    t.index ["user_id"], name: "index_app_passwords_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "url", limit: 8000, null: false
    t.string "title", limit: 256
    t.string "description", limit: 1024
    t.string "image_url", limit: 8000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_items_on_url", unique: true
  end

  create_table "marks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_marks_on_item_id"
    t.index ["user_id", "item_id"], name: "index_marks_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "index_marks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 15, null: false
    t.string "email", limit: 319, null: false
    t.string "icon_url", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "app_passwords", "users"
  add_foreign_key "marks", "items"
  add_foreign_key "marks", "users"
end
