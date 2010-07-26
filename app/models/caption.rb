class Caption < ActiveRecord::Base
  belongs_to :language
  belongs_to :asset
  
  validates_presence_of :language_id, :message => "A language for the caption must be selected"
end
