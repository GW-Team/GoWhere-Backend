class CreateChatroomMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chatroom_messages do |t|
      t.references :chatroom, foreign_key: true
      t.integer :type
      t.text :content
      t.references :child, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
