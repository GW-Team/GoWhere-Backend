class ChatroomNote < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many :chatroom_note_comments

  validates :content, presence: true
end
