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

ActiveRecord::Schema.define(:version => 20100706151647) do

  create_table "asset_is_images", :force => true do |t|
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "width"
  end

  create_table "images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "notifiers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token",   :default => "", :null => false
  end

  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
