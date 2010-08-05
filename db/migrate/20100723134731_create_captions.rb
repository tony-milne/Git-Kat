class CreateCaptions < ActiveRecord::Migration
  def self.up
    create_table :captions do |t|
      t.text :content
      t.references :language
      t.references :asset

      t.timestamps
    end
  end

  def self.down
    drop_table :captions
  end
end
