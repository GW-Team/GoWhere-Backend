class FriendApplyFormsController < ApplicationController
  include FriendsHelper
  
  def index
  end

  def create
    if current_user.users_friend_apply_form.where(apply_id: params[:id]).size > 0
      flash[:notice] = "已申請過"
    elsif current_user.applicants_friend_apply_form.where(user_id: params[:id]).size > 0
      form = FriendApplyForm.includes(:user).find_by(user_id: params[:id], apply_id: current_user.id)
      add_friend(params[:id], form)
    else
      current_user.users_friend_apply_form.create! apply_id: params[:id]
      flash[:notice] = "申請成功"
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    form = FriendApplyForm.find_by(id: params[:id])
    redirect_back fallback_location: root_path, notice: "取消申請！" if form.destroy
  end
end
