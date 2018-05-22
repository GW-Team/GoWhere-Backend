class FollowersController < ApplicationController
  before_action :find_follow_list

  def destroy
    @follow_whom = Follower.find_by(id: params[:id])
    if @follow_whom.destroy
      redirect_to news_feeds_path
    end
  end
end
