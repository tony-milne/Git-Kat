class Asset < ActiveRecord::Base
  has_attached_file :file,
  :styles => {:thumb => "230x173#"}
  
  #cattr_reader :per_page
  #@@per_page = 5
      


def self.search(search, page)
  paginate 	:per_page => 5, :page => page,
		:conditions => ['title like ?', "%#{search}%"],
		:order => 'title'

end
end
