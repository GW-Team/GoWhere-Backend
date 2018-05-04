class CreateChatGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_groups do |t|
      t.references :chatroom, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
