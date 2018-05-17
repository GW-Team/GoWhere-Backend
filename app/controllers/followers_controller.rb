class FollowersController < ApplicationController
  before_action :find_follow_list, except: [:destroy]

  def follow_whom
    @follow_whom_list.map{|val| {id: val.id, user_id: val.follower_id}}
    redirect_to :news_feeds
  end

  def follow_me
    @follow_me_list.map{|val| {id: val.id, user_id: val.user_id}}
  end

  def destroy
    Follower.where(params.permit(:user_id, :follower_id)).destroy
  end
end
