class ChatroomMessage < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later(self) }
  
  belongs_to :chatroom
  belongs_to :user

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
