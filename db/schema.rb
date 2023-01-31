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

ActiveRecord::Schema[7.0].define(version: 2023_01_31_123040) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.text "message"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.bigint "realestate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realestate_id"], name: "index_features_on_realestate_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "realestate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realestate_id"], name: "index_images_on_realestate_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title_ca"
    t.string "author"
    t.text "content_ca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "user_id"
    t.text "content_es"
    t.text "content_fr"
    t.text "content_en"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "realestates", force: :cascade do |t|
    t.string "idfile"
    t.string "idagency"
    t.string "rstype"
    t.string "reference"
    t.string "country"
    t.string "speclocation"
    t.string "typestreet"
    t.string "namestreet"
    t.string "numberstreet"
    t.float "usurface"
    t.float "csurface"
    t.decimal "salesprice"
    t.decimal "rentprice"
    t.string "region"
    t.string "province"
    t.string "postcode"
    t.string "area"
    t.string "title"
    t.text "ad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.boolean "featured", default: false
    t.bigint "town_id"
    t.bigint "user_id"
    t.string "town_name"
    t.string "operation"
    t.index ["town_id"], name: "index_realestates_on_town_id"
    t.index ["user_id"], name: "index_realestates_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "titles", force: :cascade do |t|
    t.string "bheader1_ca"
    t.string "bheader2_ca"
    t.string "bdheader1_ca"
    t.string "bdheader2_ca"
    t.string "bbutton_ca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bheader1_es"
    t.string "bheader1_en"
    t.string "bheader1_fr"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "webrealestates", force: :cascade do |t|
    t.string "status", default: "new"
    t.string "webrstype"
    t.string "operation"
    t.integer "price"
    t.string "address"
    t.float "surface"
    t.integer "bedrooms"
    t.boolean "terrace"
    t.boolean "lift"
    t.string "owner"
    t.string "email"
    t.string "phone"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "salesprice"
    t.integer "rentprice"
    t.string "flatnumber"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "features", "realestates"
  add_foreign_key "images", "realestates"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "users"
  add_foreign_key "realestates", "towns"
  add_foreign_key "realestates", "users"
  add_foreign_key "reviews", "users"
end
