class Stage < ActiveRecord::Base
  using_access_control

  has_and_belongs_to_many :assets
  has_and_belongs_to_many :asset_users
end
