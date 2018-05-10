class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.reset_password(user)
    md5 = Digest::MD5.new  
    md5 << user.email + Time.now().to_s + Devise.friendly_token()
    key = md5.hexdigest[0..7]
    user.update(password: key)
    UserMailer.send_forgot_password_email(user.email, key).deliver_now!
  end
end
