class NewsFeedComment < ApplicationRecord
  belongs_to :news_feed
  belongs_to :user

  validates :content, presence: true

end
