# Model front end for admin_user_roles table
#
# This file will be removed by the client and replaced with their own
# implementation.

class AdminUserRole < ActiveRecord::Base  
  belongs_to :admin_user
end
