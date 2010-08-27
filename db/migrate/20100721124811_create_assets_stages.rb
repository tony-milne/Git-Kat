class CreateAssetsStages < ActiveRecord::Migration
  def self.up
    create_table :assets_stages, :id => false do |t|
      t.integer :asset_id
      t.integer :stage_id
    end
  end

  def self.down
    drop_table :assets_stages
  end
end
