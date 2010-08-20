class Tag < ActiveRecord::Base
  using_access_control
  
  has_and_belongs_to_many :assets #belongs_to :asset
end
