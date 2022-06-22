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

ActiveRecord::Schema.define(version: 2022_06_22_021922) do

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
    t.integer "saunner_id", null: false
    t.integer "chat_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_groups", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.integer "owner_id"
    t.string "status"
    t.integer "saunner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["saunner_id"], name: "index_chat_groups_on_saunner_id"
  end

  create_table "chats", force: :cascade do |t|
    t.integer "saunner_id", null: false
    t.integer "chat_group_id", null: false
    t.string "message", null: false
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

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.integer "post_id"
    t.integer "comment_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_notifications_on_comment_id"
    t.index ["post_id"], name: "index_notifications_on_post_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "saunner_id", null: false
    t.integer "sauna_id", null: false
    t.date "visit_date", null: false
    t.integer "sauna_minutes", null: false
    t.integer "mizu_minutes", null: false
    t.integer "totonoi_minutes", null: false
    t.integer "sauna_times", null: false
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
    t.integer "saunner_id", null: false
    t.integer "post_id"
    t.string "name", null: false
    t.string "store_type", null: false
    t.string "target", null: false
    t.string "swap", null: false
    t.string "prefecture", null: false
    t.string "postcode", null: false
    t.string "address", null: false
    t.string "tel", null: false
    t.string "hp", null: false
    t.string "access", null: false
    t.string "holiday", null: false
    t.string "open", null: false
    t.string "fee", null: false
    t.string "stove", null: false
    t.string "heat_source", null: false
    t.integer "sauna_temperature", null: false
    t.integer "sauna_capacity", null: false
    t.string "tv", null: false
    t.text "complement"
    t.integer "mizu_temperature", null: false
    t.integer "mizu_capacity", null: false
    t.integer "depth", null: false
    t.string "vibra", null: false
    t.text "mizu_complement"
    t.string "break_space", null: false
    t.string "air_bath", null: false
    t.string "chair", null: false
    t.integer "chair_quantity"
    t.string "aufguss", null: false
    t.string "aufguss_frequency"
    t.string "auto_loyly", null: false
    t.string "auto_loyly_frequency"
    t.string "self_loyly", null: false
    t.string "inside_break_space", null: false
    t.string "wi_fi", null: false
    t.string "supply", null: false
    t.string "work_space", null: false
    t.string "restaurant", null: false
    t.string "parking", null: false
    t.string "dispenser", null: false
    t.string "oropo", null: false
    t.string "tattoo", null: false
    t.string "shampoo", null: false
    t.string "conditioner", null: false
    t.string "bodysoap", null: false
    t.string "facesoap", null: false
    t.string "razor", null: false
    t.string "toothbrush", null: false
    t.string "nylon_towell", null: false
    t.string "hairdryer", null: false
    t.string "facetowell", null: false
    t.string "bathtowell", null: false
    t.string "pants", null: false
    t.string "saunamat", null: false
    t.string "saunaboard", null: false
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
    t.integer "post_id"
    t.integer "sauna_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_deleted", default: false
    t.string "nickname"
    t.index ["email"], name: "index_saunners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_saunners_on_reset_password_token", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "saunas"
  add_foreign_key "comments", "saunners"
  add_foreign_key "post_tags", "posts"
  add_foreign_key "post_tags", "tags"
end
