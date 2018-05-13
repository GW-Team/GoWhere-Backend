class NewsFeedPhoto < ApplicationRecord
  belongs_to :news_feed

  mount_uploader :path, ImageUploader
end
