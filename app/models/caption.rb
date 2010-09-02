# Model front end for captions table

class Caption < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  using_access_control
  
  belongs_to :asset
  belongs_to :language

  validates_presence_of :language_id, :message => " for the caption must be selected"
end
