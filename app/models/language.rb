class Language < ActiveRecord::Base
  has_one :caption #has_many :captions
  has_many :credits
end
