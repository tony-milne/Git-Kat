class CreateAssetUsersStages < ActiveRecord::Migration
  def self.up
    create_table :asset_users_stages, :id => false do |t|
      t.references :asset_user
      t.references :stage
    end
  end

  def self.down
    drop_table :asset_users_stages
  end
end
