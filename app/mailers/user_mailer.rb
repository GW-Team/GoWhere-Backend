class UserMailer < ApplicationMailer

  def send_forgot_password_email(email, message)
    @msg = message
    mail(to: email, subject: "GoWhere - 忘記密碼通知信")
  end
end
