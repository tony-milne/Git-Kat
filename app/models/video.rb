class Video < ActiveRecord::Base
  using_access_control
  
  #belongs_to :asset
  has_one :asset, :as => :exif
end
