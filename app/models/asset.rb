class Asset < ActiveRecord::Base
  has_attached_file :file,
  :styles => {:thumb => "230x173#"}
  
  #cattr_reader :per_page
  #@@per_page = 5
      

def self.search(search)
if search
  find(:all, :condition=>['title LIKE?', "%#{search}%"])
  else
	find(:all)
end
end
end
