class Asset < ActiveRecord::Base
  belongs_to :exif, :polymorphic => true, :dependent => :destroy
  
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
  
  
  ## Start of EXIF code ##
  
  # Returns true if asset has EXIF data associated
  def exif?
    return true if not exif_type.nil?
    rescue
      false
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
    exif_data = EXIFR::JPEG.new(file.path)
    return if exif_data.nil? or not exif_data.exif?
      i = Image.new
      i.width            = exif_data.width
      i.height           = exif_data.height
      i.camera_brand     = exif_data.make
      i.camera_model     = exif_data.model
      i.exposure_time    = exif_data.exposure_time.to_s
      i.f_number         = exif_data.f_number.to_f
      i.iso_speed_rating = exif_data.iso_speed_ratings
      i.shot_date_time   = exif_data.date_time
      i.focal_length     = exif_data.focal_length.to_f
      self.exif = i
      self.save!
    rescue
      false
  end

end
