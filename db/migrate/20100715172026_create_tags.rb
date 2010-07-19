class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
    t.integer :id
    t.string :title
    t.integer :asset_id
   

      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
