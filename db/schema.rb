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

ActiveRecord::Schema.define(version: 2022_06_11_073844) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.integer "saunner_id", null: false
    t.integer "post_id", null: false
    t.integer "sauna_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["sauna_id"], name: "index_comments_on_sauna_id"
    t.index ["saunner_id"], name: "index_comments_on_saunner_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "saunner_id", null: false
    t.integer "post_id", null: false
    t.integer "sauna_id"
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
    t.string "store_type"
    t.string "target"
    t.string "swap"
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
    t.string "tv"
    t.text "complement"
    t.integer "mizu_temperature"
    t.integer "mizu_capacity"
    t.integer "depth"
    t.string "vibra"
    t.string "break_space"
    t.string "air_bath"
    t.string "chair"
    t.integer "chair_quantity"
    t.string "aufguss"
    t.string "aufguss_frequency"
    t.string "auto_loyly"
    t.string "auto_loyly_frequency"
    t.string "self_loyly"
    t.string "inside_break_space"
    t.string "wi_fi"
    t.string "supply"
    t.string "work_space"
    t.string "restaurant"
    t.string "parking"
    t.string "dispenser"
    t.string "oropo"
    t.string "tattoo"
    t.string "shampoo"
    t.string "conditioner"
    t.string "bodysoap"
    t.string "facesoap"
    t.string "razor"
    t.string "toothbrush"
    t.string "nylon_towell"
    t.string "hairdryer"
    t.string "facetowell"
    t.string "bathtowell"
    t.string "pants"
    t.string "saunamat"
    t.string "saunaboard"
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
    t.string "last_name"
    t.string "first_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_deleted", default: false
    t.string "nickname"
    t.index ["email"], name: "index_saunners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_saunners_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "saunas"
  add_foreign_key "comments", "saunners"
end
