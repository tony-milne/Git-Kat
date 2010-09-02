# Model front end for stage_users table.  An intermediate table for
# has_many :through association between stages and assets.  Stage_users is
# required since stage user needs to have record of whether or not they have
# agreed to the stage contract.

class StageUser < ActiveRecord::Base
  belongs_to :asset_user
  belongs_to :stage
end
