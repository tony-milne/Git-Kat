class CreateAssetIsImages < ActiveRecord::Migration
  def self.up
    create_table :asset_is_images do |t|
      t.references :image
      t.timestamps
    end
  end

  def self.down
    drop_table :asset_is_images
  end
end
