class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.references :asset
      t.integer :width
      t.integer :height
      t.string :camera_brand
      t.string :camera_model
      t.string :exposure_time
      t.float :f_number
      t.integer :iso_speed_rating
      t.float :focal_length
      t.datetime :shot_date_time
    end
  end

  def self.down
    drop_table :images
  end
end
