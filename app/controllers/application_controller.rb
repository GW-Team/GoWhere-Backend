class ApplicationController < ActionController::Base
  # #User http auth
  # protect_from_forgery with: :exception
  # 使用者強制登入後動作
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def find_follow_list
    @follow_whom_list = Follower.where(user_id: current_user.id)
    @follow_me_list = Follower.where(follower_id: current_user.id)
  end

  def find_follow_apply_list
    @follow_whom_list = FollowerApplyForm.where(user_id: current_user.id)
    @follow_me_list = FollowerApplyForm.where(follower_id: current_user.id)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[ :email, :password, :passowrd_confirm, :gender, :phone, :nickname, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys:[ :password, :passowrd_confirm, :gender, :phone, :nickname, :first_name, :last_name, :is_public, :current_password, :avatar ])
  end

end
