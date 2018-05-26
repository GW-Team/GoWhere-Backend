class FriendsController < ApplicationController
  def create
    form = FriendApplyForm.includes(:user).find_by(id: params[:form_id])
    current_user.friends_friend.create!(user_id: params[:id])
    current_user.users_friend.create!(friend_id: params[:id])
    chatroom = Chatroom.create(is_group: false, is_notify: true, float_top: false)
    chatroom.chatroom_groups.create(user_id: current_user.id, is_admin: true)
    chatroom.chatroom_groups.create(user_id: params[:id], is_admin: true)
    form.destroy
    redirect_back fallback_location: root_path
  end

  def destroy
    room = Chatroom.find_by(id: params[:chatroom_id])
    room.destroy if room
    friend = Friend.where("(user_id = ? and friend_id = ?) or (user_id = ? and friend_id = ?)", current_user.id, params[:id], params[:id], current_user.id)
    friend.destroy_all if friend
    redirect_back fallback_location: root_path
  end
end
