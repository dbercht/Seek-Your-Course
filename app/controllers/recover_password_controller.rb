require 'active_support/secure_random'

class RecoverPasswordController < ApplicationController
  def new
  end

  def create
		@user = User.where("email=?", params[:email]).first
		if @user.nil?
			flash[:error] = "No records found with the provided email address."
			render :action => 'new'
    else
			random_string = ActiveSupport::SecureRandom.hex(8)
			@user.password = random_string
			@user.password_confirmation = random_string
			if @user.save				
	      UserMailer.password_recovery_email(@user, random_string).deliver
				flash[:notice] = "An e-mail has been sent to your e-mail with your new password"
				redirect_to login_path
			else
				flash[:error] = "An error has occurred, please try again or contact Seek Your Course administration."
				render :action => 'new'
			end
		end
  end

end
