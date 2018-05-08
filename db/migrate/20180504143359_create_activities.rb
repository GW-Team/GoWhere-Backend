class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :chatroom, foreign_key: true
      t.string :name
      t.datetime :activity_date
      t.text :content
      t.boolean :anonymous

      t.timestamps
    end
  end
end
