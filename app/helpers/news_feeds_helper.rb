module NewsFeedsHelper
  def like_amount(id)
    NewsFeedLike.where(news_feed_id: id).size
  end

  def comment_amount(id)
    NewsFeedComment.where(news_feed_id: id).size
  end

  def like_or_unlike(id)
    if NewsFeedLike.find_by(news_feed_id: id, user_id: current_user.id)
      link_to "dislike", news_feed_like_path(id), method: :delete
    else
      link_to "like", news_feed_like_path(id), method: :put
    end
  end
end
