class UserSession < Authlogic::Session::Base 
  find_by_login_method :find_by_username_or_email

 # Fix
  include ActiveModel::Conversion
  def persisted?
    false
  end
  # End of fix 
end
