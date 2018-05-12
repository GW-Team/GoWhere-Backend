class NewsFeed < ApplicationRecord
  belongs_to :user

  has_many :news_feed_photos
  has_many :news_feed_likes
  has_many :news_feed_comments
  has_many :favorites
end
