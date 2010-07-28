class AddLanguages < ActiveRecord::Migration
  def self.up
  	%w(English Español Deutsch Français Italiano Nederlands).each do |l|
  		Language.new(:language => l).save
  		end
  end

  def self.down
  	Language.destroy_all
  end
end
