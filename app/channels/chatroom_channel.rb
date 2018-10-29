class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatrooms_#{params['chatroom_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def chat(data)
    message = data['message']
    type = (message.index 'youtu') ? 3 : data['message_type']
    content = message.split('/').last.sub('watch?v=', '')
    chatroom_id = data['chatroom_id']

    user = User.find_by(identifier: data['user'])
    user.chatroom_messages.create(chatroom_id: chatroom_id, message_type: type, content: content)

    
    groups = ChatroomGroup.includes(:chatroom, :user)
                          .where(chatroom_id: chatroom_id, "chatrooms.is_group": false)
                          .where.not(user_id: user.id)
                          .first
    if groups
      user = groups.user
      start_at = user.notification_start_at.strftime("%H:%M")
      end_at = user.notification_end_at.strftime("%H:%M")
      now = Time.now.strftime("%H:%M")
      
      if start_at && end_at
        user.chatroom_messages.create(chatroom_id: chatroom_id, message_type: 1, content: user.canned_message) unless (start_at...end_at).include?(now)
      end
    end
  end
end
