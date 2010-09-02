# Model front end for admin_users table
#
# This file will be removed by the client and replaced with their own
# implementation.

class AdminUser < ActiveRecord::Base
  # Method from declarative authorization that allows permission based filtering
  # for models.
  acts_as_authentic
  
  has_many :admin_user_roles
  
  def role_symbols
    (admin_user_roles || []).map {|r| r.name.to_sym}
  end
end
