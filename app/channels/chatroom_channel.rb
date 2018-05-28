class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatrooms_#{params['chatroom_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def chat(data)
    user = User.find_by(identifier: data['user'])
    user.chatroom_messages.create(chatroom_id: data['chatroom_id'], message_type: data['message_type'], content: data['message'])
  end
end
