class Caption < ActiveRecord::Base
  belongs_to :asset
  belongs_to :language

  validates_presence_of :language_id, :message => "A language for the caption must be selected"
end
