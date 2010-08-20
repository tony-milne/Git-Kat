class Image < ActiveRecord::Base
  using_access_control
  
  has_one :asset, :as => :exif
end
