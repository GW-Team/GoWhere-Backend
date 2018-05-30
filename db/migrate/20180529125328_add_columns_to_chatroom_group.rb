class AddColumnsToChatroomGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :chatroom_groups, :is_notify, :boolean, default: true
    add_column :chatroom_groups, :float_top, :boolean, default: false
    change_column :chatroom_groups, :is_admin, :boolean, default: false
  end
end
