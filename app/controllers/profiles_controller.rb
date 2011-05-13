class ProfilesController < ApplicationController
  before_filter :login_required
  before_filter :check_for_existing_profile, :only => [:new, :create]
  
  def new
    @profile = Profile.new
    @user = current_user
    @profile.preferences = Hash.new
  end

  def create
    @user = current_user
    @profile = Profile.create(params[:profile])
    respond_to do |format|
      if @profile.save
        current_user.profile = @profile
        format.html { redirect_to(current_user, :id => current_user.id, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => current_user, :id => current_user.id, :status => :created, :location => current_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @user = current_user
    if current_user.profile.nil?
      redirect_to :action => "new"
    else
      @profile = current_user.profile
    end
  end
  
  def update
    @user = current_user
    @profile = current_user.profile
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(current_user, :id => current_user.id, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end

  end


  private
    def check_for_existing_profile
      if !current_user.profile.nil?
        redirect_to :action => 'edit'
        logger.debug("In if**************")
      end
    end
   
end
