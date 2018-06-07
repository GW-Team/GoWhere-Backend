class ChatroomNote < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  has_many :chatroom_note_comments, dependent: :destroy

  validates :content, presence: true
end
