class AddWidthToAsset < ActiveRecord::Migration
  def self.up
    add_column :assets, :width, :integer
  end

  def self.down
    remove_column :assets, :width
  end
end
