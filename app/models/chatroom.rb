class Chatroom < ApplicationRecord
  has_many :chatroom_photos, dependent: :destroy
  has_many :chatroom_notes, dependent: :destroy
  has_many :chatroom_messages, dependent: :destroy
  has_many :activity, dependent: :destroy
  has_many :chatroom_groups, dependent: :destroy

  mount_uploader :picture, ImageUploader
  
  with_options if: :is_group do |group|
    group.validates :name, presence: true
  end

  def admins
    chatroom_groups.map{|user| user.user_id if user.is_admin}.compact
  end

  def users
    chatroom_groups.map{|user| user.user_id}.compact
  end
end
