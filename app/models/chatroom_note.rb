class ChatroomNote < ApplicationRecord
  belongs_to :chatroom
  has_many :chatroom_note_comments
end
