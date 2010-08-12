class Asset < ActiveRecord::Base
  belongs_to :exif, :polymorphic => true, :dependent => :destroy
  belongs_to :country
  has_many :tribe
  
  has_many :captions 

  accepts_nested_attributes_for :captions #not present in ajax branch
  has_many :credits #was has_many

  has_and_belongs_to_many :tags #has_many :tags
  has_and_belongs_to_many :stages

  validates_presence_of :country

  # before_destroy :ensure_not_referenced_by_any_stage_item

  # Uploading Images Using Paperclip
  has_attached_file	:data,
			:url => "/assets/photos/:id/:style/:basename.:extension",
			:path => "/assets/photos/:id/:style/:basename.:extension",

  # Resizing Images
  #For windows systems, the greater than sign '>' must be escaped with the hat '^' symbol
  #The '^' is not required on *nix systems
  :styles => {:thumb => ["193x120", :jpg], :medium => ["350x350", :jpg], :large => ["540x337", :jpg]},

  # Connection to S3
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :s3_options => {:proxy => {:host => 'proxy.abdn.ac.uk', :port => 8080} }, #note to team: if working from home
                                                                             #comment out :s3_options then restart server
  :bucket => "survival-project"

  # Checking Filetypes
  validates_attachment_presence :data
  validates_attachment_content_type :data, :content_type => ["image/jpeg", "image/png", "image/bmp", "image/tiff", "image/pjpeg", "image/x-png", "image/jpg"]

  # Sets EXIF data for asset before uploading to Amazon S3
  after_post_process :set_exif_data

  # Saves tags and captions updated in virtual attributes
  after_update :save_tags, :save_captions, :save_credits

  # Pagination
  cattr_reader :per_page
  @@per_page = 12


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

  ## Start of virtual attributes and save methods for AJAX forms ##

  def updated_tag_attributes=(tag_attributes)
    tags.reject(&:new_record?).each do |tag|
      attributes = tag_attributes[tag.id.to_s]
      if attributes
        if(attributes[:content].eql? tag[:content])
          #do nothing
        else
          new_tag = Tag.find_or_create_by_content(attributes[:content])
          if(tags.exists?(new_tag))
            #do nothing
          else
            tags.delete(tag)
            tags << new_tag
          end
        end
      else
        tags.delete(tag)
      end
    end
  end

  def new_tag_attributes=(tag_attributes)
    new_tags = Set.new

    tag_attributes.each do |a|
      new_tags.add(a)
    end

    new_tags.each do |nt|
      if nt[:content].eql? ""
        #do nothing
      else
        tag = Tag.find_or_create_by_content(nt[:content])
        if !tags.exists?(tag)
          tags << tag #self.tags
        end
      end
    end
  end

  def save_tags
    tags.each do |tag|
      tag.save(false)
    end
  end

  def updated_tribe_attributes=(tribe_attributes)
  tribes.reject(&:new_record?).each do |tribe|
    attributes = tribe_attributes[tribe.id.to_s]
    if attributes
    tribe.attributes = attributes
    else
    tribes.delete(tribe)
    end
  end
  end

  def new_tribe_attributes=(tribe_attributes)
  tribe_attributes.each do |a|
    tribe.build(a)
  end
  end

  def save_tribes
  tribes.each do |tribe|
    tribe.save(false)
  end
  end

  def updated_caption_attributes=(caption_attributes)
    captions.reject(&:new_record?).each do |caption|
      attributes = caption_attributes[caption.id.to_s]
      if attributes
        caption.attributes = attributes
      else
        captions.delete(caption)
      end
    end
  end

  def new_caption_attributes=(caption_attributes)
    caption_attributes.each do |a|
      captions.build(a)
    end
  end

  def save_captions
    captions.each do |caption|
      caption.save(false)
    end
  end

  def updated_credit_attributes=(credit_attributes)
    credits.reject(&:new_record?).each do |credit|
      attributes = credit_attributes[credit.id.to_s]
      if attributes
        credit.attributes = attributes
      else
        credits.delete(credit)
      end
    end
  end

  def new_credit_attributes=(credit_attributes)
    credit_attributes.each do |a|
      credits.build(a)
    end
  end

  def save_credits
    credits.each do |credit|
      credit.save(false)
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

