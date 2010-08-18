class AssetUser < ActiveRecord::Base
  acts_as_authentic
  
  #has_many :asset_user_roles
  
  def role_symbols
    [:asset_user]
  end
end
