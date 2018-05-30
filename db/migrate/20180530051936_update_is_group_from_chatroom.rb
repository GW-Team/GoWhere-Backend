class UpdateIsGroupFromChatroom < ActiveRecord::Migration[5.2]
  def change
    change_column :chatrooms, :is_group, :boolean, default: false
  end
end
