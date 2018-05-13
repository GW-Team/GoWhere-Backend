class ChatroomPhoto < ApplicationRecord
  belongs_to :chatroom
  mount_uploader :path, ImageUploader
end
