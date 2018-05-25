class FollowersController < ApplicationController
  before_action :find_follow_list , only: [:follow_whom, :follow_me]

  def destroy
    @follow_whom = Follower.find_by(id: params[:id])
    redirect_to news_feeds_path if @follow_whom.destroy
  end
end
