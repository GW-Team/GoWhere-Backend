class NewsFeedCommentsController < ApplicationController
  before_action :find_news_feed, except: [:destroy]
  before_action :find_comment, only: [:edit, :update, :destroy]

  def index

  end

  def new
    @comment = @news_feed.news_feed_comments.create()
  end

  def create
    @comment = @news_feed.news_feed_comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to news_feed_comments_path(@news_feed)
    else
      render :new
    end
  end

  def edit
    authorize! :manage, @comment
  end

  def update
    authorize! :manage, @comment
    if @comment.update(comment_params)
      redirect_to news_feed_comments_path(@news_feed)
    else
      render :edit
    end
  end

  def destroy
    authorize! :manage, @comment
    @comment.destroy if @comment
    redirect_to news_feed_comments_path(@news_feed)
  end

  private
  def find_news_feed
    @news_feed = NewsFeed.includes(:news_feed_comments).find_by(id: params[:news_feed_id])
  end

  def find_comment
    @comment = NewsFeedComment.includes(:news_feed).find_by(id: params[:id])
    if @comment
      @news_feed = @comment.news_feed
    end
  end

  def comment_params
    params.require(:news_feed_comment).permit(:content)
  end

end
