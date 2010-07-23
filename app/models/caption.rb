class Caption < ActiveRecord::Base
 belongs_to :asset
 belongs_to :language
end
