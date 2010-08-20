class Language < ActiveRecord::Base
  using_access_control
  
  has_one :caption #has_many :captions
  has_many :credits
end
