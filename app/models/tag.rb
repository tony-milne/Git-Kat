# Model front end for tags table

class Tag < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  using_access_control
  
  has_and_belongs_to_many :assets
end
