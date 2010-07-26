class Language < ActiveRecord::Base
 has_many :captions
 has_many :credits
end
