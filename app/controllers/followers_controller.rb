class FollowersController < ApplicationController
  before_action :find_follow_list

  def destroy
    redirect_back fallback_location: root_path if Follower.find_by(id: params[:id]).destroy
  end
end
