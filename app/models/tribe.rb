# Model front end for tribess table

class Tribe < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  using_access_control
  
  has_many :assets
end

