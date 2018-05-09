class CreateNewsFeedComments < ActiveRecord::Migration[5.2]
  def change
    create_table :news_feed_comments do |t|
      t.references :news_feed, foreign_key: true
      t.boolean :is_join
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
