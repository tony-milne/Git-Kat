class CreateStageUsers < ActiveRecord::Migration
  def self.up
    create_table :stage_users do |t|
      t.references :asset_user
      t.references :stage
      t.boolean :has_agreed_to_contract, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :stage_users
  end
end
