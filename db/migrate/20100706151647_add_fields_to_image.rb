class AddFieldsToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :width, :integer
    add_column :images, :height, :integer
    add_column :images, :camera_brand, :string
    add_column :images, :camera_model, :string
    add_column :images, :exposure_time, :string
    add_column :images, :f_number, :float
    add_column :images, :iso_speed_rating, :integer
    add_column :images, :focal_length, :float
    add_column :images, :shot_date_time, :datetime
  end

  def self.down
    remove_column :images, :width
    remove_column :images, :height
    remove_column :images, :camera_brand
    remove_column :images, :camera_model
    remove_column :images, :exposure_time
    remove_column :images, :f_number
    remove_column :images, :iso_speed_rating
    remove_column :images, :focal_length
    remove_column :images, :shot_date_time
  end
end
