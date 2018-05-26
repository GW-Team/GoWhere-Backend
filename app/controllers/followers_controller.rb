class FollowersController < ApplicationController
  before_action :find_follow_list

  def destroy
    redirect_to root_path if Follower.find_by(id: params[:id]).destroy
  end
end
