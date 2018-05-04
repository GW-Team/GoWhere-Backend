class CreateAttractionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :attraction_comments do |t|
      t.references :attraction, foreign_key: true
      t.boolean :is_join
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
