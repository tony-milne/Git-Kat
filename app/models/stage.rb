# Model front end for stages table

class Stage < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  using_access_control
  
  # has_many :through association between stages, assets and stage_users
  has_many :stage_users, :dependent => :destroy
  has_many :asset_users, :through => :stage_users

  has_and_belongs_to_many :assets
  belongs_to :contract
end
