class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.references :chatroom, foreign_key: true
      t.integer :type
      t.text :content
      t.integer :child_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
