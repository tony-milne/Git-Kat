class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :exif_id
      t.string :exif_type
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
