class CreateActivityComments < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_comments do |t|
      t.references :activity, foreign_key: true
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
