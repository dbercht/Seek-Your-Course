ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :address               => "smtp.webfaction.com",
 :port => 25,
 :domain                => "seekyourcourse.com",
 :user_name             => "jetgreene_info",
 :password              => "syc!111",
 :authentication        => "plain",
 :enable_starttls_auto => false
}
