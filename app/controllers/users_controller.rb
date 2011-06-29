class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :index, :show]
  before_filter :load_profile, :only => [:edit, :update]
  
  def index
    @profiles = Profile.all(:joins => :user, :conditions => ["users.role = ?",  params[:role]], :order => "users.last_name").paginate(:page => params[:page], :per_page => 12)
  end

  def new
    @user = User.new
    @locations = Location.all
  end

  def manage_home
  end

  def show
    @user = User.where("username = ?", params[:id]).first
    #Restriction
    @profile = @user.profile
    @offerings = @user.coordinated_offerings.validated.future_offerings.includes(:plan, :topics, :type, :location, :coordinator, :region, :registered_artists).limit(3)
    
#@future_offerings = 
		@offerings = @offerings | @user.offerings.validated.future_offerings.includes(:plan, :topics, :type, :location, :coordinator, :region, :registered_artists)
    @past_offerings = @user.offerings.validated.past_offerings.includes(:plan, :topics, :type, :location, :coordinator, :region, :registered_artists)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to manage_home_path
      #redirect_to user_path(current_user), :notice => "Thank you for signing up! You are now logged in."
    else
      @locations = Location.all
      render :action => 'new'
    end
  end

  def edit
    @user = current_user 
    @locations = Location.all
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to edit_profiles_path(current_user), :notice => "Your information has been updated."
    else
      @locations = Location.all
      render :action => 'edit'
    end
  end
  
  private
    def load_profile
      @profile = current_user.profile
    end
end
