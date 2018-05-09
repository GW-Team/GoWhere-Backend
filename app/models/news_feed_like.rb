class NewsFeedLike < ApplicationRecord
  belongs_to :news_feed
  belongs_to :user
end
