class StageUser < ActiveRecord::Base
  belongs_to :asset_user
  belongs_to :stage
end
