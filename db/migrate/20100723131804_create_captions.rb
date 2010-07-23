class CreateCaptions < ActiveRecord::Migration
  def self.up
    create_table :captions do |t|
      t.string :caption
      t.references :asset
      t.references :language
      t.timestamps
    end
  end

  def self.down
    drop_table :captions
  end
end
