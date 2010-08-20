class Credit < ActiveRecord::Base
  using_access_control

  belongs_to :asset
  belongs_to :language
end
