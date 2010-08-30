class AddLanguages < ActiveRecord::Migration
  def self.up
    Authorization::Maintenance::without_access_control do
  	  %w(English Español Deutsch Français Italiano Nederlands Português).each do |l|
  		  Language.new(:language => l).save
  		end
		end
  end


  def self.down
  	Language.destroy_all
  end
end
