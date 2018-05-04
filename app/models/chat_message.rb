class ChatMessage < ApplicationRecord
  belongs_to :chatroom
  belongs_to :child
  belongs_to :user
end
