class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
      t.boolean :is_group
      t.string :name
      t.string :picture
      t.boolean :is_notify
      t.boolean :float_top

      t.timestamps
    end
  end
end
