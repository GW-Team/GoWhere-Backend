class FriendsController < ApplicationController
  include FriendsHelper

  def index
    @friends = current_user.users_friend
  end

  def create
    form = FriendApplyForm.includes(:user).find_by(id: params[:form_id])
    add_friend(params[:id], form)
    redirect_back fallback_location: root_path
  end

  def destroy
    friend_id = params[:id].to_i
    users = [current_user.id, friend_id]

    groups = ChatroomGroup.where("user_id in (?)", users).map{|group| group.chatroom_id}.compact.uniq
    room = Chatroom.where("id in (?) and is_group = ?", groups, false).first
    room.destroy if room

    friend = Friend.where("(user_id = ? and friend_id = ?) or (user_id = ? and friend_id = ?)", current_user.id, params[:id], params[:id], current_user.id)
    friend.destroy_all if friend

    followers = Follower.where("follower_id = ? and user_id = ? or follower_id = ? and user_id = ? ", current_user.id, friend_id, friend_id, current_user.id)
    followers.destroy_all if followers

    redirect_back fallback_location: root_path
  end
end
