class ApiV1::FollowerApplyFormsController < ApiController
  def I_want_to_follow_whom
    begin
      forms = FollowerApplyForm.where(params.permit(:user_id))
      return_msg({result: true, forms: forms.map{|val| {form_id: val.id, user_id: val.follower_id}}}, 200)
    rescue
      return_msg({result: false, message: "Server Error"}, 500)
    end
  end

  def who_wants_to_follow_me
    begin
      forms = FollowerApplyForm.where(follower_id: params['user_id'])
      return_msg({result: true, forms: forms.map{|val| {form_id: val.id, user_id: val.user_id}}}, 200)
    rescue
      return_msg({result: false, message: "Server Error"}, 500)
    end
  end

  def create
    begin
      if params['user_id'] == params['follower_id']
        return_msg({message: "不要邊緣到追蹤自己好嗎？"}, status: 400)
      elsif Follower.where(user_id: params['follower_id'], follower_id: params['user_id']).length > 0
        return_msg({message: "已經追蹤了"}, 200)
      end
      
      if User.find(params['follower_id']).is_public
        Follower.create(params.permit(:user_id, :follower_id))
        return_msg({message: "追蹤成功"}, 200)
      else
        follower_apply()
      end

    rescue 
      return_msg({message: "系統錯誤"}, 500)
    end
  end

  def update
    begin
      apply_form = FollowerApplyForm.find(params.require(:id))
      if apply_form == nil
        return_msg({message: "不要妄想有人會追蹤你好嗎？"}, 400)
        return
      else
        follower = Follower.create(user_id: params['follower_id'], follower_id: params['user_id'])
        apply_form.destroy
        return_msg({message: "同意完成。"}, 200)
      end
    rescue
      return_msg({message: "系統錯誤"}, 500)
    end
  end

  def destroy
    begin
      FollowerApplyForm.find(params.require(:id)).destroy
      return_msg({message: "取消成功"}, 200)
    rescue
      return_msg({message: "系統錯誤"}, 500)
    end
  end

  private
  def follower_apply
    if FollowerApplyForm.where(params.permit(:user_id, :follower_id)).length > 0
      return_msg({message: "已申請過"}, 200)
    else
      form = FollowerApplyForm.create(params.permit(:user_id, :follower_id))
      return_msg({message: "申請成功", form_id: form.id}, 200)
    end
  end
end
