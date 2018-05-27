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

  
end
