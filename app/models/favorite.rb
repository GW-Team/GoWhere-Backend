class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :news_feed
end
