class Country < ActiveRecord::Base
  using_access_control  
  
  has_many :assets
end
