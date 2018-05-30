class NewsFeedLikesController < ApplicationController
  def update
    current_user.news_feed_likes.create! news_feed_id: params[:id]
    redirect_back fallback_location: root_path
  end

  def destroy
    news_feed_like = NewsFeedLike.find_by(news_feed_id: params[:id], user_id: current_user.id)
    redirect_back fallback_location: root_path if news_feed_like.destroy
  end
end
