class Credit < ActiveRecord::Base
 belongs_to :asset
 belongs_to :language
end
