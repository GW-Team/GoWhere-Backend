class NewsFeed < ApplicationRecord
  belongs_to :user

  has_many :news_feed_photos, dependent: :destroy
  has_many :news_feed_likes, dependent: :destroy
  has_many :news_feed_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  mount_uploader :picture, ImageUploader

end
