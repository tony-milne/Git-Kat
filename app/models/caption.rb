class Caption < ActiveRecord::Base
  belongs_to :language
  belongs_to :asset
end
