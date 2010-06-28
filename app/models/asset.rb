class Asset < ActiveRecord::Base
  has_attached_file :file

  def self.search(search)
if search
  find(:all, :condition=>['title LIKE?', "%#{search}%"])
  else
	find(:all)
end
end
end
