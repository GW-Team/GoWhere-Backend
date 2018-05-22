class FollowerApplyFormsController < ApplicationController
  def update
    if User.find_by(id: params[:id]).is_public
      current_user.users_follower.create! follower_id: params[:id]
    end
    redirect_to news_feeds_path
  end

  def destroy
  end

  private
  def follower_apply
    if FollowerApplyForm.where(params.permit(:user_id, :follower_id)).length > 0
      # notice: "已申請過"
    else
      form = FollowerApplyForm.create(params.permit(:user_id, :follower_id))
      # notice: "申請成功"
    end
  end
end
