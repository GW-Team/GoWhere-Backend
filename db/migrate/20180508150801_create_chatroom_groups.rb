class CreateChatroomGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :chatroom_groups do |t|
      t.references :chatroom, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_admin

      t.timestamps
    end
  end
end
