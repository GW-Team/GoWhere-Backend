class Activity < ApplicationRecord
  belongs_to :chatroom
  has_many :activity_participants
  has_many :activity_comments
end
