class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash.now[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'action'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
      if(@user.update_attributes(params[:user]))
        flash.now[:notice] = "Successfully updated user."
      end
      render :action => 'edit'
  end

end
