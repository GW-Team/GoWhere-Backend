class NewsFeedsController < ApplicationController
  before_action :find_news_feed, only: [:edit, :update, :destroy]

  def index
    @news_feeds = NewsFeed.all
    @news_feed = NewsFeed.create()
  end

  def create
    @news_feed = current_user.news_feeds.create! (news_feed_params)
    if @news_feed.save
      redirect_to root_path
    else
      render :index
    end
  end

  def edit

  end

  def update
    if @news_feed.update(news_feed_params)
      redirect_to root_path, notice: "修改成功"
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path, notice: "刪除成功" if @news_feed.destroy
  end

  private
  def news_feed_params
    params.require(:news_feed).permit(:description, :lat, :lng, :is_private)
  end

  def find_news_feed
    @news_feed = current_user.news_feeds.find_by(id: params[:id])
  end
end
