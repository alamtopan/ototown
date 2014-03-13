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

ActiveRecord::Schema.define(version: 20140313234112) do

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

  create_table "messages", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.text     "content"
    t.integer  "recipient_id"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "operators", ["email"], name: "index_operators_on_email", unique: true, using: :btree
  add_index "operators", ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true, using: :btree
  add_index "operators", ["role_id"], name: "index_operators_on_role_id", using: :btree
  add_index "operators", ["unlock_token"], name: "index_operators_on_unlock_token", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.string   "condition"
    t.string   "type"
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
  end

end
