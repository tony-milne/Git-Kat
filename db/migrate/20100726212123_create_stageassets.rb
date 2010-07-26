class CreateStageassets < ActiveRecord::Migration
  def self.up
    create_table :stageassets do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :stageassets
  end
end
