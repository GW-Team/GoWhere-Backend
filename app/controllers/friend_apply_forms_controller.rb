class FriendApplyFormsController < ApplicationController
  def index
  end

  def create
    if current_user.users_friend_apply_form.where(apply_id: params[:id]).size > 0
      flash[:notice] = "已申請過"
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
