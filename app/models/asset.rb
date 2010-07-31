class Asset < ActiveRecord::Base
  belongs_to :exif, :polymorphic => true, :dependent => :destroy
  has_and_belongs_to_many :tags
  has_many :captions
  
  # Uploading Images Using Paperclip
  has_attached_file	:data,
			:url => '/assets/photos/:id/:style/:basename.:extension',
			:path => '/assets/:id/:style/:basename.:extension',
  
  # Resizing Images
  #For windows systems, the greater than sign '>' must be escaped with the hat '^' symbol
  #The '^' is not required on *nix systems
  :styles => {:thumb => "230x173", :medium => "350x350", :large => "640x480"},
  
  # Connection to S3
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :s3_options => { :proxy => { :host => 'proxy.abdn.ac.uk', :port => 8080 } },
  :bucket => "survival-project"

  # Checking Filetypes 
  validates_attachment_presence :data
  validates_attachment_content_type :data, :content_type => ["image/jpeg", "image/png", "image/bmp", "image/tiff", "image/pjpeg", "image/x-png", "image/jpg"]
  
  after_post_process :set_exif_data
  
  # Pagination
  cattr_reader :per_page
  @@per_page = 10

  
  # Search
  def self.search(search, page)
    paginate 	:per_page => 12, :page => page,
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
    if data_content_type =~ /^image.*/
      if data_content_type =~ /jpeg/
        set_image_exif_data
      end
    end
  end

  def tag_attributes=(tag_attributes)
    new_tags = Set.new
    
    tag_attributes.each do |a|
      new_tags.add(a)
    end
    
    new_tags.each do |nt|
      if nt[:content].eql? ""
        #do nothing
      else
        tag = Tag.find_or_create_by_content(nt[:content])
        self.tags << tag
      end
    end
  end
  
  def caption_attributes=(caption_attributes)
    caption_attributes.each do |a|
      self.captions.build(a)
    end
  end

  private
  def set_image_exif_data
    exif_data = EXIFR::JPEG.new(data.to_file.path)
    return if exif_data.nil? or not exif_data.exif?
      i = Image.new
      i.width            = exif_data.width
      i.height           = exif_data.height
      i.camera_brand     = exif_data.make.to_s
      i.camera_model     = exif_data.model.to_s
      i.exposure_time    = exif_data.exposure_time.to_s
      i.f_number         = exif_data.f_number.to_f
      i.iso_speed_rating = exif_data.iso_speed_ratings
      i.shot_date_time   = exif_data.date_time
      i.focal_length     = exif_data.focal_length.to_f
      self.exif = i
      i.save!
    rescue
      false
  end

end
