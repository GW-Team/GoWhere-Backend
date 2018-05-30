class FriendsController < ApplicationController
  def create
    form = FriendApplyForm.includes(:user).find_by(id: params[:form_id])
    current_user.friends_friend.create(user_id: params[:id])
    current_user.users_friend.create(friend_id: params[:id])
    chatroom = Chatroom.create
    chatroom.chatroom_groups.create(user_id: current_user.id)
    chatroom.chatroom_groups.create(user_id: params[:id])
    form.destroy
    redirect_back fallback_location: root_path
  end

  def destroy
    users = [current_user.id, params[:id].to_i]
    groups = ChatroomGroup.where("user_id in (?)", users).map{|group| group.chatroom_id}.compact.uniq
    room = Chatroom.where("id in (?) and is_group = false", groups).first
    room.destroy if room
    friend = Friend.where("(user_id = ? and friend_id = ?) or (user_id = ? and friend_id = ?)", current_user.id, params[:id], params[:id], current_user.id)
    friend.destroy_all if friend
    redirect_back fallback_location: root_path
  end
end
