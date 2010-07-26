class Stageasset < ActiveRecord::Base
belongs_to :stages
has_one :asset

# Pagination
  cattr_reader :per_page
  @@per_page = 6


  # Search
  def self.search(search, page)
	paginate 	:per_page => 6, :page => page,
	  :conditions => ['title like ?', "%#{search}%"],
	  :order => 'title'

end
end