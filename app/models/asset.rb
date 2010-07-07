class Asset < ActiveRecord::Base
  has_one :image
  has_one :video
  
  has_attached_file :file,
  
  #For windows systems, the greater than sign '>' must be escaped with the hat '^' symbol
  #The '^' is not required on *nix systems
  :styles => {:thumb => "230x173#", :medium => "350x350#", :large => "600x480^>"}
      
  cattr_reader :per_page
  @@per_page = 10


def self.search(search, page)
  paginate 	:per_page => 3, :page => page,
		:conditions => ['title like ?', "%#{search}%"],
		:order => 'title'
end

def set_exif_data
  if file_content_type =~ /^image.*/
    if file_content_type =~ /jpeg/
      set_image_exif_data
    end
  end
end

private
  def set_image_exif_data
    exif = EXIFR::JPEG.new(self.file.path)
    return if exif.nil? or not exif.exif?
      i = self.create_image
      i.width            = exif.width
      i.height           = exif.height
      i.camera_brand     = exif.make
      i.camera_model     = exif.model
      i.exposure_time    = exif.exposure_time.to_s
      i.f_number         = exif.f_number.to_f
      i.iso_speed_rating = exif.iso_speed_ratings
      i.shot_date_time   = exif.date_time
      i.focal_length     = exif.focal_length.to_f
      i.save
    rescue
      false
  end

end
