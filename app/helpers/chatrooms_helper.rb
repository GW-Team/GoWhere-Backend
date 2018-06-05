module ChatroomsHelper
  def get_friend(chatroom)
    chatroom.chatroom_groups.map{|group| group if group.user_id != current_user.id}.compact
  end

  def note_exist?(id)
    ChatroomNote.find_by(id: id).nil?
  end

  def show_message(message)
    (message.content.length == 20) ? "#{message.content}..." : message.content
  end
end
