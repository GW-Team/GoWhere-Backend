module ApplicationHelper
  def find_fullname(id)
    user = find_user(id)
    user.first_name + user.last_name
  end

  def find_user(id)
    User.find_by(id: id)
  end

  def get_chatrooms
    chatroom_ids = current_user.chatroom_groups.map{|group| group.chatroom_id}
    chatrooms = Chatroom.includes(chatroom_groups: :user).where("id in (?)", chatroom_ids)
    @groups  = chatrooms.map{|chatroom| chatroom if chatroom.is_group}.compact
    @friends = chatrooms.map{|chatroom| chatroom unless chatroom.is_group}.compact
  end
end
