class FollowerApplyForm < ApplicationRecord
  belongs_to :follower
  belongs_to :user
end
