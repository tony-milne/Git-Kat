class CreateNotifiers < ActiveRecord::Migration
  def self.up
    create_table :notifiers do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :notifiers
  end
end
