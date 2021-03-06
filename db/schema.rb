# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100828150556) do

  create_table "admin_user_roles", :force => true do |t|
    t.string  "name"
    t.integer "admin_user_id"
  end

  create_table "admin_users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asset_users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.integer  "exif_id"
    t.string   "exif_type"
    t.string   "title"
    t.integer  "country_id"
    t.integer  "tribe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
  end

  create_table "assets_stages", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "stage_id"
  end

  create_table "assets_tags", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "tag_id"
  end

  create_table "captions", :force => true do |t|
    t.text     "content"
    t.integer  "language_id"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credits", :force => true do |t|
    t.string   "content"
    t.integer  "asset_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "width"
    t.integer  "height"
    t.string   "camera_brand"
    t.string   "camera_model"
    t.string   "exposure_time"
    t.float    "f_number"
    t.integer  "iso_speed_rating"
    t.float    "focal_length"
    t.datetime "shot_date_time"
  end

  create_table "languages", :force => true do |t|
    t.string "language"
  end

  create_table "stage_users", :force => true do |t|
    t.integer  "asset_user_id"
    t.integer  "stage_id"
    t.boolean  "has_agreed_to_contract", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contract_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tribes", :force => true do |t|
    t.string   "name"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
