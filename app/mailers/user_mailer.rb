class UserMailer < ActionMailer::Base
  default :from => "welcome@seekyourcourse.com"
  default_url_options[:host] = "localhost:3000"

  def welcome_email(user)
    @user = user
    attachments.inline['seekyourcourse.png'] = File.read("#{Rails.root}/public/images/seekyourcourse.png")
    mail(:to => user.email,
         :subject => "Welcome to Seek Your Course")
  end
end
