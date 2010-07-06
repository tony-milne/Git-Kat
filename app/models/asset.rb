class Asset < ActiveRecord::Base
  has_attached_file :file, :styles =>
   { :large => "600x550#",
   :medium => "350x350#", 
  :thumb => "230x173#" } 
  
  cattr_reader :per_page
  @@per_page = 10


def self.search(search, page)
  paginate 	:per_page => 3, :page => page,
		:conditions => ['title like ?', "%#{search}%"],
		:order => 'title'

end
end
