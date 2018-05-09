class CreateNewsFeedLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :news_feed_likes do |t|
      t.references :news_feed, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
