class UsersController < ApplicationController
  before_action :find_follow_list, only: [:show]

  def index
    keyword = params[:search] 
    if keyword
      @users = User.where('email LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR nickname LIKE ? OR first_name||last_name LIKE ?',
            "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    end
  end
  
  def show
  end

  def edit
  end

  def update
    current_user.update_with_password(user_params)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
  
  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
