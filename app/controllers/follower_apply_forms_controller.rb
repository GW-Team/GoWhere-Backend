class FollowerApplyFormsController < ApplicationController
  before_action :find_follow_apply_list, only: [:i_want_to_follow_whom, :who_wants_to_follow_me]
  
  def create
    if User.find_by(id: params[:id]).is_public
      current_user.users_follower.create! follower_id: params[:id]
    else
      follower_apply
    end
    redirect_back fallback_location: root_path
  end

  def update
    current_user.followers_follower.create! user_id: params[:id]
    form.destroy
    redirect_back fallback_location: root_path, notice: "成功接受！"
  end

  def destroy
    if form ||=FollowerApplyForm.find_by(follower_id: current_user.id, user_id: params[:id])
      redirect_back fallback_location: root_path, notice: "成功拒絕！" if form.destroy
    else
      @follow_whom = FollowerApplyForm.find_by(id: params[:id])
      redirect_back fallback_location: root_path, notice: "成功取消申請！" if @follow_whom.destroy
    end
  end

  private
  def follower_apply
    if FollowerApplyForm.where(user_id: current_user.id, follower_id: params[:id]).size > 0
      flash[:notice] = "已申請過"
    else
      current_user.users_follower_apply_form.create! follower_id: params[:id]
      flash[:notice] = "申請成功"
    end
  end
end
