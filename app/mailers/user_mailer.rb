class UserMailer < ActionMailer::Base
  default :from => "info@seekyourcourse.com"
  default_url_options[:host] = "seekyourcourse.com"

  def welcome_email(user)
    @user = user
    attachments.inline['seekyourcourse.png'] = File.read("#{Rails.root}/public/images/seekyourcourse.png")
    attachments.inline['facebook.png'] = File.read("#{Rails.root}/public/images/facebook_30px.png")
    attachments.inline['twitter.png'] = File.read("#{Rails.root}/public/images/twitter_30px.png")
    mail(:to => user.email,
         :subject => "Welcome to Seek Your Course")
  end

	def password_recovery_email(user, password_string)
		@user = user
		@password_string = password_string
		    attachments.inline['seekyourcourse.png'] = File.read("#{Rails.root}/public/images/seekyourcourse.png")
    attachments.inline['facebook.png'] = File.read("#{Rails.root}/public/images/facebook_30px.png")
    attachments.inline['twitter.png'] = File.read("#{Rails.root}/public/images/twitter_30px.png")
    mail(:to => user.email,
         :subject => "Seek Your Course account password changed.")
  end
end
