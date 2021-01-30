# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_30_131312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collabs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "description"
    t.string "category"
    t.string "address"
    t.bigint "collab_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collab_id"], name: "index_exhibitions_on_collab_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "art_type"
    t.text "description"
    t.string "city"
    t.string "country"
    t.date "birthday"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_collabs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "collab_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collab_id"], name: "index_users_collabs_on_collab_id"
    t.index ["user_id"], name: "index_users_collabs_on_user_id"
  end

  create_table "users_work_of_arts", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "work_of_art_id", null: false
  end

  create_table "work_of_arts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "creation_date"
    t.bigint "user_id", null: false
    t.bigint "collab_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collab_id"], name: "index_work_of_arts_on_collab_id"
    t.index ["user_id"], name: "index_work_of_arts_on_user_id"
  end

  create_table "work_of_arts_favorites", force: :cascade do |t|
    t.bigint "work_of_art_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_work_of_arts_favorites_on_user_id"
    t.index ["work_of_art_id"], name: "index_work_of_arts_favorites_on_work_of_art_id"
  end

  add_foreign_key "exhibitions", "collabs"
  add_foreign_key "users_collabs", "collabs"
  add_foreign_key "users_collabs", "users"
  add_foreign_key "work_of_arts", "collabs"
  add_foreign_key "work_of_arts", "users"
  add_foreign_key "work_of_arts_favorites", "users"
  add_foreign_key "work_of_arts_favorites", "work_of_arts"
end
