class OfferingsController < ApplicationController
  before_filter :load_variables, :only => [:new, :create, :edit, :update]
  before_filter :require_login, :only => [:new, :create]
 
 def index
    @title = "Offerings"
    @offerings = Offering.find(:all, :conditions => ["validated=?", true])
  end

  def show
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
    @artists = []
  end

  def create
    @offering = Offering.new(params[:offering])
    if (@offering.valid?)
      @offering.coordinator = current_user
      @offering.save!
      flash[:notice] = "Successfully created offering."
      redirect_to @offering
    else
      render :action => 'new'
    end
  end
  
  def add_registered_artist
    @username = params[:username].split(' ').last.to_s
    @artist = User.find(:first, :conditions => ['username = ?', @username])
    @artist_text = @artist.to_json
    logger.info @artist_text
    render :text => @artist_text
  end
  
  def edit
    @offering = Offering.find(params[:id])
    @artists = @offering.registered_artists
    if !allowed_to_edit?(@offering)
      render :show
    end
    logger.info "#{allowed_to_edit?(@offering)}**********************"
    
  end

  def update
    @offering = Offering.find(params[:id])
      if(@offering.update_attributes(params[:offering]))
        flash[:notice] = "Successfully updated offering."
        redirect_to @offering
      else
        @artists = @offering.registered_artists
        render :action => 'edit'
      end
  end

  def destroy
    @offering = Offering.find(params[:id])
    @offering.destroy
    flash[:notice] = "Successfully destroyed offering."
    redirect_to offerings_url
  end
  
  protected
  
  def load_variables
    @regions = Region.find(:all)
    @topics = Topic.find(:all)
    @types = Type.find(:all)
    @locations = Location.all
    @plans = Plan.find(:all)
  end
  
end
