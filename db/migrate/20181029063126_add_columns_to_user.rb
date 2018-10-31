class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :notification_start_at, :time
    add_column :users, :notification_end_at, :time
    add_column :users, :canned_message, :string
  end
end
