# Model front end for images table.  Contains EXIF/metadata relating to
# assets.

class Image < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  using_access_control
  
  # Polymorphic association to asset model.
  has_one :asset, :as => :exif
end
