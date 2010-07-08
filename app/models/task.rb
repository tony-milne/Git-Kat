class Task < ActiveRecord::Base
  has_many :assets, :as => :attachedfile, :dependent => :destroy
  
  validate :validate_attachments
  
  Max_Attachments = 5
  Max_Attachment_Size = 1.megabyte

def validate_attachments
  errors.add_to_base("Too many attachments - maximum is #{Max_Attachments}") if assets.length > Max_Attachments
  assets.each {|a| errors.add_to_base("#{a.name} is over #{Max_Attachment_Size/1.megabyte}MB") if a.file_size > Max_Attachment_Size}
end

end
