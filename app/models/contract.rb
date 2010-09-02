# Model front end for contracts table

class Contract < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  using_access_control
  
  has_many :stages
end
