class AddAssetsToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :asset_id, :integer
    add_column :albums, :album_id, :integer
  end

  def self.down
    remove_column :albums, :album_id
    remove_column :albums, :asset_id
  end
end
