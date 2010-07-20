class Album < ActiveRecord::Base
	has_many :assets, :dependent => :destroy
 
# Pagination
  	cattr_reader :per_page
  	@@per_page = 3

# Search
  def self.search(search, page)
    paginate 	:per_page => 3, :page => page,
      :conditions => ['id like ?', "%#{search}%"],
      :order => 'id'
end
end