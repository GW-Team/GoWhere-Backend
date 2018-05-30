class RemoveColumnsFromChatroom < ActiveRecord::Migration[5.2]
  def change
    remove_column :chatrooms, :is_notify
    remove_column :chatrooms, :float_top
  end
end
