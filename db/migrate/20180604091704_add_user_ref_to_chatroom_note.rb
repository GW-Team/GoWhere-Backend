class AddUserRefToChatroomNote < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatroom_notes, :user, foreign_key: true
  end
end
