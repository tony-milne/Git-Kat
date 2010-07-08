class Image < ActiveRecord::Base
  has_one :asset, :as => :exif
end
