class ChatroomGroupsController < ApplicationController
  before_action :find_chatroom, only: [:index, :create]

  def index
  end

  def create
    group = @chatroom.chatroom_groups.new(user_id: params[:user_id])
    if group.save
      redirect_back fallback_location: root_path
    else
      render :index
    end
  end

  def destroy
    group = ChatroomGroup.includes(:chatroom).find_by(id: params[:id])
    my_group = (group.user == current_user)
    group.destroy
    if my_group
      redirect_to root_path  
    else
      redirect_back fallback_location: root_path
    end
  end

  private
  def find_chatroom
    @chatroom = Chatroom.includes(chatroom_groups: :user).find_by(id: params[:chatroom_id])
    group_users = @chatroom.chatroom_groups.map{|val| val.user_id}.compact
    @friends = current_user.users_friend.map{|friend| friend if group_users.index(friend.friend_id).nil?}.compact
  end
end
