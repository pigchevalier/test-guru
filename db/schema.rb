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

ActiveRecord::Schema.define(version: 2021_11_26_111232) do

  create_table "answers", force: :cascade do |t|
    t.string "text", null: false
    t.boolean "correct", default: false, null: false
    t.integer "id_question_id", null: false
    t.integer "id_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_question_id"], name: "index_answers_on_id_question_id"
    t.index ["id_user_id"], name: "index_answers_on_id_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.integer "id_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_test_id"], name: "index_categories_on_id_test_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text", null: false
    t.string "answer", null: false
    t.integer "id_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_test_id"], name: "index_questions_on_id_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password"
    t.boolean "access_admin", null: false
    t.integer "id_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_test_id"], name: "index_users_on_id_test_id"
  end

  add_foreign_key "answers", "id_questions"
  add_foreign_key "answers", "id_users"
  add_foreign_key "categories", "id_tests"
  add_foreign_key "questions", "id_tests"
  add_foreign_key "users", "id_tests"
end
