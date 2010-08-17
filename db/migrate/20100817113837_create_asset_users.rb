class CreateAssetUsers < ActiveRecord::Migration
  def self.up
    create_table :asset_users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :login_count
      t.integer :failed_login_count
      t.timestamps
    end
  end

  def self.down
    drop_table :asset_users
  end
end
