class AssetUser < ActiveRecord::Base
  acts_as_authentic
  
  has_and_belongs_to_many :stages
  
  def role_symbols
    [:asset_user]
  end
end
