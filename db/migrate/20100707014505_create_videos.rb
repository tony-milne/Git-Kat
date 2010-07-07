class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.references :asset
    end
  end

  def self.down
    drop_table :videos
  end
end
