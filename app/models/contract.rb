class Contract < ActiveRecord::Base
  using_access_control
  
  has_many :stages
end
