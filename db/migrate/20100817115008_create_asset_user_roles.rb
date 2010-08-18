class CreateAssetUserRoles < ActiveRecord::Migration
  def self.up
    create_table :asset_user_roles do |t|
      t.string :name
      t.references :asset_user
    end
  end

  def self.down
    drop_table :asset_user_roles
  end
end
