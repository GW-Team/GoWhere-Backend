module NewsFeedsHelper
  def like_amount(id)
    NewsFeedLike.where(news_feed_id: id).size
  end

  def comment_amount(id)
    NewsFeedComment.where(news_feed_id: id).size
  end

  def like_or_unlike(id, news_feed)
    if NewsFeedLike.find_by(news_feed_id: id, user_id: current_user.id)
      link_to "<span><i class=\"material-icons left\">favorite_border</i>#{news_feed.news_feed_likes.size}</span>".html_safe, news_feed_like_path(id), method: :delete, class: "waves-effect active"
    else
      link_to "<span><i class=\"material-icons left\">favorite_border</i>#{news_feed.news_feed_likes.size}</span>".html_safe, news_feed_like_path(id), method: :put, class: "waves-effect"
    end
  end

  def comment(id, news_feed)
    link_to "<span><i class=\"material-icons left\">chat_bubble_outline</i>#{news_feed.news_feed_comments.size}</span>".html_safe, news_feed_comments_path(id), class: "waves-effect"
  end

  def news_feed_photo(news_feed)
    if news_feed.news_feed_photos
      news_feed.news_feed_photos.first.path.url
    else
      "aircraft.jpg"
    end
  end
end
