class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :news_feeds
  has_many :news_feed_likes
  has_many :news_feed_comments
  has_many :friends_friend, :class_name => 'Friend', :foreign_key => 'friend_id'
  has_many :users_friend, :class_name => 'Friend', :foreign_key => 'user_id'
  has_many :applicants_friend_apply_form, :class_name => 'FriendApplyForm', :foreign_key => 'apply_id'
  has_many :users_friend_apply_form, :class_name => 'FriendApplyForm', :foreign_key => 'user_id'
  has_many :users_follower, :class_name => 'Follower', :foreign_key => 'user_id'
  has_many :followers_follower, :class_name => 'Follower', :foreign_key => 'follower_id'
  has_many :users_follower_apply_form, :class_name => 'FollowerApplyForm', :foreign_key => 'user_id'
  has_many :followers_follower_apply_form, :class_name => 'FollowerApplyForm', :foreign_key => 'follower_id'
  has_many :favorites
  has_many :chatroom_note_comments
  has_many :chatroom_messages
  has_many :chatroom_groups
  has_many :activity_participants
  has_many :activity_comments
  
  mount_uploader :avatar, ImageUploader

  validates :first_name, :last_name, presence: true


  def self.reset_password(user)
    base64 = Base64.encode64(user.email + Time.now().to_s + Devise.friendly_token())
    key = base64[0..7]
    user.update(password: key)
    UserMailer.send_forgot_password_email(user.email, key).deliver_now!
  end

  def display_name
    return nickname if nickname.present? 
    return "#{first_name} #{last_name}" if first_name.present? && last_name.present?
    email.split('@').first
  end

  def list_name
    (nickname.present?) ? "#{first_name} #{last_name} (#{nickname})" : "#{first_name} #{last_name}"
  end
end
