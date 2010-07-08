class Video < ActiveRecord::Base
  #belongs_to :asset
  has_one :asset, :as => :exif
end
