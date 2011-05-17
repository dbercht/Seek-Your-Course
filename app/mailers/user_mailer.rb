class UserMailer < ActionMailer::Base
  default :from => "welcome@seekyourcourse.com"

  def welcome_email(user)
    @user = user
    mail(:to => user.email,
         :subject => "Welcome to Seek Your Course")
  end
end
