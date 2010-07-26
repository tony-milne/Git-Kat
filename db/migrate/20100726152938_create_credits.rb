class CreateCredits < ActiveRecord::Migration
  def self.up
    create_table :credits do |t|
		t.string :credit
		t.references :asset
		t.references :language
      t.timestamps
    end
  end

  def self.down
    drop_table :credits
  end
end
