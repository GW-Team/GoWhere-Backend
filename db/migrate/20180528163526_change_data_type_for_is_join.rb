class ChangeDataTypeForIsJoin < ActiveRecord::Migration[5.2]
  def change
    rename_column(:news_feed_comments, :is_join, :content)
    change_column(:news_feed_comments, :content, :string)
  end
end
