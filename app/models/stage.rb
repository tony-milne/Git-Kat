class Stage < ActiveRecord::Base
  using_access_control
  
  has_many :stage_users, :dependent => :destroy
  has_many :asset_users, :through => :stage_users

  has_and_belongs_to_many :assets
  belongs_to :contract
end
