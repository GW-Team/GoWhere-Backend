module ChatroomsHelper
  def get_friend(chatroom)
    chatroom.chatroom_groups.map{|group| group if group.user_id != current_user.id}.compact
  end
end
