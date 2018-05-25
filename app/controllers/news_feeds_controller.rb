class NewsFeedsController < ApplicationController
  before_action :find_follow_list , only:[ :index ]
  def index
    if params[:search]
      @users = User.where('email LIKE ? OR first_name LIKE ? OR last_name LIKE ?',
            "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end
end
