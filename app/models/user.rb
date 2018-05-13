class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :news_feeds
  has_many :news_feed_likes
  has_many :news_feed_comments
  has_many :friend_friends, :class_name => 'Friend', :foreign_key => 'friend_id'
  has_many :friend_users, :class_name => 'Friend', :foreign_key => 'user_id'
  has_many :friend_apply_form_applicants, :class_name => 'FriendApplyForm', :foreign_key => 'apply_id'
  has_many :friend_apply_form_users, :class_name => 'FriendApplyForm', :foreign_key => 'user_id'
  has_many :favorites
  has_many :chatroom_note_comments
  has_many :chatroom_messages
  has_many :chatroom_groups
  has_many :activity_participants
  has_many :activity_comments

  mount_uploader :avatar, ImageUploader




  def self.reset_password(user)
    md5 = Digest::MD5.new  
    md5 << user.email + Time.now().to_s + Devise.friendly_token()
    key = md5.hexdigest[0..7]
    user.update(password: key)
    UserMailer.send_forgot_password_email(user.email, key).deliver_now!
  end
end
