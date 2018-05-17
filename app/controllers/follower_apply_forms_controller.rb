class FollowerApplyFormsController < ApplicationController
  def create
    if params['user_id'] == params['follower_id']
      # notice: "不要邊緣到追蹤自己好嗎？"
    elsif Follower.where(user_id: params['follower_id'], follower_id: params['user_id']).length > 0
      # notice: "已經追蹤了"
    end

    if User.find(params['follower_id']).is_public
      Follower.create(params.permit(:user_id, :follower_id))
      # notice: "追蹤成功"
    else
      follower_apply
    end

    render "news_feeds#index"
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
