class AdminUser < ActiveRecord::Base
  acts_as_authentic
  
  has_many :admin_user_roles
  
  def role_symbols
    (admin_user_roles || []).map {|r| r.name.to_sym}
  end
end
