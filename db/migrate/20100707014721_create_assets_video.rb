class CreateAssetsVideo < ActiveRecord::Migration
  def self.up
    create_table :assets_videos, :id => false do |t|
      t.integer :asset_id
      t.integer :video_id
    end
  end

  def self.down
    drop_table :assets_videos
  end
end
