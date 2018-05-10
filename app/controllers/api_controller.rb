class ApiController < ActionController::Base
  before_action :authenticate_user_from_token!
  skip_before_action :verify_authenticity_token, raise: false


  def authenticate_user_from_token!
    puts """
    ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    #{request.headers['Authorization']}
    #{params}
    ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    """

    if request.headers['Authorization'] == nil 
      render :json => { :message => "Authorization failed, please login again." }, :status => 401
    end
  end
end