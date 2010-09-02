# Model front end for languages table

class Language < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  using_access_control
  
  has_many :caption
  has_many :credits
end
