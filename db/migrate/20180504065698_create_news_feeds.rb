class CreateNewsFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :news_feeds do |t|
      t.text :description, null: false
      t.decimal :lat
      t.decimal :lng
      t.references :user, foreign_key: true
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end
