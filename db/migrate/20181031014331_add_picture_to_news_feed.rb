class AddPictureToNewsFeed < ActiveRecord::Migration[5.2]
  def change
    add_column :news_feeds, :picture, :string
  end
end
