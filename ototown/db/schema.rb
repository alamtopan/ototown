# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140410110210) do

  create_table "advertisements", force: true do |t|
    t.string   "title"
    t.date     "publish"
    t.date     "unpublish"
    t.string   "position"
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "active"
    t.string   "link_url"
    t.text     "content"
  end

  create_table "advertises", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.decimal  "price",         precision: 10, scale: 0
    t.integer  "product_id"
    t.integer  "loan_term"
    t.integer  "interest_rate"
    t.decimal  "down_payment",  precision: 10, scale: 0
    t.string   "category"
    t.date     "start_at"
    t.date     "end_at"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_news", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.text     "content"
    t.integer  "advertise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealer_infos", force: true do |t|
    t.text     "address"
    t.integer  "dealer_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.string   "phone"
    t.string   "email"
    t.string   "category_type"
    t.string   "longitude"
    t.string   "latitude"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "image_dealers", force: true do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.integer  "dealer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.text     "content"
    t.integer  "recipient_id"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brand_name"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.datetime "published_at"
    t.text     "content"
    t.string   "source"
    t.integer  "category_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.date     "publish"
    t.date     "unpublish"
  end

  create_table "operators", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "operators", ["email"], name: "index_operators_on_email", unique: true, using: :btree
  add_index "operators", ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true, using: :btree
  add_index "operators", ["role_id"], name: "index_operators_on_role_id", using: :btree
  add_index "operators", ["unlock_token"], name: "index_operators_on_unlock_token", unique: true, using: :btree

  create_table "page_contents", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "url"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.string   "condition"
    t.string   "type_product"
    t.string   "brand"
    t.string   "model"
    t.string   "year"
    t.string   "color"
    t.string   "plate_number"
    t.date     "exp_date"
    t.integer  "kilometer"
    t.integer  "door"
    t.integer  "seat"
    t.string   "transmission"
    t.string   "engine"
    t.integer  "cyclinders"
    t.string   "fuel"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "province"
    t.integer  "user_id"
    t.decimal  "price",        precision: 10, scale: 0
    t.boolean  "status"
    t.boolean  "negotiable"
    t.string   "slug"
  end

  create_table "profiles", force: true do |t|
    t.string   "full_name"
    t.date     "birthday"
    t.string   "address"
    t.string   "city"
    t.string   "codepos"
    t.string   "gender"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "province"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "web_settings", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "keywords"
    t.text     "header_tags"
    t.text     "footer_tags"
    t.string   "contact"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pav_icon_file_name"
    t.string   "pav_icon_content_type"
    t.integer  "pav_icon_file_size"
    t.datetime "pav_icon_updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

end
