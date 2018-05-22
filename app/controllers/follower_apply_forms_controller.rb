class FollowerApplyFormsController < ApplicationController
  def create
    # if params['user_id'] == params['follower_id']
    #   # notice: "不要邊緣到追蹤自己好嗎？"
    # elsif Folclower.where(user_id: params['follower_id'], follower_id: params['user_id']).length > 0
    #   # notice: "已經追蹤了"
    # end

    if User.find(id: params[:id]).is_public
      current_user.users_follower.create(follower_id: params.permit[:id])
    else
      follower_apply
    end
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
