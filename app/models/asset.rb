class Asset < ActiveRecord::Base
  has_attached_file :file,
      :styles => {:thumb => "230x173#",
      :large => "640x480#>",
      :medium => "150x150#"}

  def self.search(search)
if search
  find(:all, :condition=>['title LIKE?', "%#{search}%"])
  else
	find(:all)
end
end
end
