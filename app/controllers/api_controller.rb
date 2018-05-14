class ApiController < ActionController::Base
  before_action :authenticate_user_from_token!
  skip_before_action :verify_authenticity_token, raise: false


  def authenticate_user_from_token!
    # 判斷 header 是否帶 auth token
    if request.headers['Authorization'] == nil 
      return_msg({ message: "Authorization failed, please login again." }, 401)
      return
    end

    # 查詢 user 並判斷是否正確
    @user = User.where(authentication_token: request.headers['Authorization'].split("Basic ")[1])
    if @user.length == 0
      return_msg({ message: "User not found or authorization token is error."}, 404)
      return
    end

    # 判斷 token 是否逾期
    @user = @user.first
    auth_time = ((Time.now - @user.authentication_token_time) / 1.minutes).round
    if auth_time > 15
      return_msg({ message: "驗證逾期！"}, 401 )
      return
    end
  end

  def return_msg(json, stauts)
    render json: json, status: status
  end
  
end