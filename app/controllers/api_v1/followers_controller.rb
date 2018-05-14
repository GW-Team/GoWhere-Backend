class ApiV1::FollowersController < ApiController
  def destroy
    begin
      Follower.where(params.permit(:user_id, :follower_id)).destroy
      return_msg({message: "取消成功"}, 200)
    rescue
      return_msg({message: "系統錯誤"}, 500)
    end
  end

  def follow_whom
    begin
      forms = Follower.where(params.permit(:user_id))
      return_msg({result: true, forms: forms.map{|val| {id: val.id, user_id: val.follower_id}}}, 200)
    rescue
      return_msg({result: false, message: "Server Error"}, 500)
    end
  end

  def follow_me
    begin
      forms = Follower.where(follower_id: params['user_id'])
      return_msg({result: true, forms: forms.map{|val| {id: val.id, user_id: val.user_id}}}, 200)
    rescue
      return_msg({result: false, message: "Server Error"}, 500)
    end
  end
end
