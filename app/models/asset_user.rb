# Model front end for asset_users table

class AssetUser < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  acts_as_authentic
  
  has_many :stage_users, :dependent => :destroy
  has_many :stages, :through => :stage_users
  
  # Required by declarative authorization, this method is called to determine
  # the user's role.
  def role_symbols
    [:asset_user]
  end
end
