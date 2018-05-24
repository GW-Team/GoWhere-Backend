class FollowerApplyFormsController < ApplicationController
  def update
    if User.find_by(id: params[:id]).is_public
      current_user.users_follower.create! follower_id: params[:id]
    else
      follower_apply
    end
    redirect_to news_feeds_path
  end

  def destroy
  end

  private
  def follower_apply
    if FollowerApplyForm.where(user_id: current_user.id, follower_id: params[:id]).length > 0
      flash[:notice] = "已申請過"
    else
      current_user.users_follower_apply_form.create! follower_id: params[:id]
      flash[:notice] = "申請成功"
    end
    redirect_to news_feeds_path
  end
end
