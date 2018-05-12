class Chatroom < ApplicationRecord
  has_many :chatroom_photos
  has_many :chatroom_notes
  has_many :chatroom_messages
  has_many :activity
  has_many :chatroom_groups
end
