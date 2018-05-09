class CreateNewsFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :news_feeds do |t|
      t.string :name
      t.text :description
      t.double :lat
      t.double :lng
      t.references :user, foreign_key: true
      t.boolean :is_private
      t.float :rating

      t.timestamps
    end
  end
end
