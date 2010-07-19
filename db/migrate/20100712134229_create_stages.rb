class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
      t.integer :id
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
