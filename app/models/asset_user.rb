class AssetUser < ActiveRecord::Base
  acts_as_authentic
  
  has_many :stage_users, :dependent => :destroy
  has_many :stages, :through => :stage_users
  
  def role_symbols
    [:asset_user]
  end
end
