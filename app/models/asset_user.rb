class AssetUser < ActiveRecord::Base
  acts_as_authentic
  
  def role_symbols
    [:asset_user]
  end
end
