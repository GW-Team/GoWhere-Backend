class FriendApplyForm < ApplicationRecord
  belongs_to :apply
  belongs_to :user
end
