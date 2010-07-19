class AddAssetsToStages < ActiveRecord::Migration
  def self.up
    add_column :stages, :asset_id, :integer
  end

  def self.down
    remove_column :stages, :asset_id
  end
end
