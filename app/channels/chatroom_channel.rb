class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatrooms_#{params['chatroom_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def chat(data)
    user = User.find_by(identifier: data['user'])
    message = data['message']
    type = (message.index 'youtu') ? 3 : data['message_type']
    content = message.split('/').last.sub('watch?v=', '')
    user.chatroom_messages.create(chatroom_id: data['chatroom_id'], message_type: type, content: content)
  end
end
