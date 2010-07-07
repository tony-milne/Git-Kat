class CreateAssetsImages < ActiveRecord::Migration
  def self.up
    create_table :assets_images, :id => false do |t|
      t.integer :asset_id
      t.integer :image_id
    end
  end

  def self.down
    drop_table :assets_images
  end
end
