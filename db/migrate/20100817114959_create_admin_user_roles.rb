class CreateAdminUserRoles < ActiveRecord::Migration
  def self.up
    create_table :admin_user_roles do |t|
      t.string :name
      t.references :admin_user
    end
  end

  def self.down
    drop_table :admin_user_roles
  end
end
