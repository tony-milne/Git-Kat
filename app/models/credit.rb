# Model front end for credits table

class Credit < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  using_access_control

  belongs_to :asset
  belongs_to :language
end
