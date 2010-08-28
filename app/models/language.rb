class Language < ActiveRecord::Base
  using_access_control
  
  has_many :caption
  has_many :credits
end
