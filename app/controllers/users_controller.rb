class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :index, :show]
  before_filter :load_profile, :only => [:edit, :update]
  
  def index
    @users = User.where('role = ?', params[:role]).order('name')
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @future_offerings = @user.offerings.future_offerings.includes(:plan, :topics, :type, :location, :coordinator, :region, :registered_artists).limit(3)
    @past_offerings = @user.offerings.past_offerings.includes(:plan, :topics, :type, :location, :coordinator, :region, :registered_artists).limit(3)
    @offerings = @user.coordinated_offerings.future_offerings.includes(:plan, :topics, :type, :location, :coordinator, :region, :registered_artists).limit(3)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user]) && @user.profile.update_attributes(params[:profile_attributes])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
  
  private
    def load_profile
      @profile = current_user.profile
    end
end
