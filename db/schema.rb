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

ActiveRecord::Schema.define(version: 2022_06_04_143809) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "chat_group_users", force: :cascade do |t|
    t.integer "saunner_id"
    t.integer "chat_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_groups", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "saunner_id"
    t.integer "chat_group_id"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "saunner_id"
    t.integer "post_id"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "saunner_id"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "saunner_id"
    t.integer "sauna_id"
    t.date "visit_date"
    t.integer "sauna_minutes"
    t.integer "mizu_minutes"
    t.integer "totonoi_minutes"
    t.integer "sauna_times"
    t.text "sauna_post"
    t.string "food_name"
    t.text "food_post"
    t.integer "sauna_temperature"
    t.integer "mizu_temperature"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "saunas", force: :cascade do |t|
    t.integer "saunner_id"
    t.string "name"
    t.string "type"
    t.boolean "target", default: true
    t.boolean "swap", default: false
    t.string "prefecture"
    t.string "postcode"
    t.string "address"
    t.string "tel"
    t.string "hp"
    t.string "access"
    t.string "holiday"
    t.string "open"
    t.string "fee"
    t.string "stove"
    t.string "heat_source"
    t.integer "sauna_temperature"
    t.integer "sauna_capacity"
    t.boolean "tv", default: false
    t.text "complement"
    t.integer "mizu_temperature"
    t.integer "mizu_capacity"
    t.integer "depth"
    t.boolean "vibra", default: false
    t.boolean "break_space", default: false
    t.boolean "air_bath", default: false
    t.string "chair"
    t.integer "chair_quantity"
    t.boolean "aufguss", default: false
    t.string "aufguss_frequency"
    t.boolean "auto_loyly", default: false
    t.string "auto_loyly_frequency"
    t.boolean "self_loyly", default: false
    t.boolean "inside_break_space", default: false
    t.boolean "wi_fi", default: false
    t.boolean "supply", default: false
    t.boolean "work_space", default: false
    t.boolean "restaurant", default: false
    t.boolean "parking", default: false
    t.boolean "dispenser", default: false
    t.boolean "oropo", default: false
    t.boolean "tattoo", default: false
    t.boolean "shampoo", default: false
    t.boolean "conditioner", default: false
    t.boolean "bodysoap", default: false
    t.boolean "facesoap", default: false
    t.boolean "razor", default: false
    t.boolean "toothbrush", default: false
    t.boolean "nylon_towel", default: false
    t.boolean "hairdryer", default: false
    t.boolean "facetowel", default: false
    t.boolean "bathtowell", default: false
    t.boolean "pants", default: false
    t.boolean "saunamat", default: false
    t.boolean "saunaboard", default: false
    t.text "free_text"
    t.boolean "is_active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "saunners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_deleted", default: false
    t.index ["email"], name: "index_saunners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_saunners_on_reset_password_token", unique: true
  end

end
