class UserMailer < ApplicationMailer
	default from: 'harborapp@gmail.com'
 
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Harbor!')
  end
end
