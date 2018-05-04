class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nick_name, :string
    add_column :users, :phone, :string
    add_column :users, :avatar, :string
    add_column :users, :gender, :integer, default: 3
    add_column :users, :description, :text
    add_column :users, :key, :string
    add_column :users, :device_type, :integer
    add_column :users, :device_token, :string
    add_column :users, :is_public, :boolean
  end
end
