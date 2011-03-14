# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user, :logged_in?, :admin_logged_in?
  
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section" 
      redirect_to register_url # Prevents the current action from running
    end
  end
  
  def require_admin
    unless admin_logged_in?
      flash[:error] = "You must be an admin to access this page." 
      redirect_to :back # Prevents the current action from running
    end
  end


  def allowed_to_edit?(offering)
    if(!logged_in?)
      flash[:error] = "You cannot edit this offering"
      false
    elsif(!((current_user == offering.coordinator) | (current_user.admin == true)))
      flash[:error] = "You cannot edit this offering"
      false
    else
      true
    end
  end

  # The logged_in? method simply returns true if the user is logged in and
  # false otherwise. It does this by "booleanizing" the current_user method
  # we created previously using a double ! operator. Note that this is not
  # common in Ruby and is discouraged unless you really mean to convert something
  # into true or false.

  private  
  def current_user_session  
    return @current_user_session if defined?(@current_user_session)  
    @current_user_session = UserSession.find  
  end  
  
  def current_user  
    @current_user = current_user_session && current_user_session.record  
  end  


  def logged_in?
    !!current_user
  end

  def admin_logged_in?
    if(logged_in?)
        !!current_user.admin
    else
      false
    end
        
  end

end
