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

ActiveRecord::Schema[7.0].define(version: 2022_07_15_235005) do
  create_table "adoptions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "animal_id", null: false
    t.integer "user_pet_care_id", null: false
    t.index ["animal_id"], name: "index_adoptions_on_animal_id"
    t.index ["user_pet_care_id"], name: "index_adoptions_on_user_pet_care_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.float "age"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_pet_care_id", default: 0, null: false
    t.string "animal_type"
    t.boolean "adopted", default: false
    t.index ["user_pet_care_id"], name: "index_animals_on_user_pet_care_id"
  end

  create_table "user_pet_cares", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_user_pet_cares_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user_pet_cares_on_reset_password_token", unique: true
  end

  add_foreign_key "adoptions", "animals"
  add_foreign_key "adoptions", "user_pet_cares"
  add_foreign_key "animals", "user_pet_cares"
end
