class OfferingsController < ApplicationController
  before_filter :load_variables, :only => [:new, :create, :edit, :update]
  before_filter :require_login, :only => [:new, :create]
  before_filter :require_admin, :only => :unvalidated_offerings
 
 def index
    @title = "Offerings"
    @offerings = Offering.validated
  end
  
  def unvalidated_offerings
    @offerings = Offering.unvalidated
    render :action => 'index'
end
  
  def show
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
    @artists = []
    @locations = []
  end

  def create
    @offering = Offering.new(params[:offering])
    @locations = []
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
    @locations = @offering.region.locations
    if !allowed_to_edit?(@offering)
      render :show
    end
  end

  def update
    @offering = Offering.find(params[:id])
    @offering.registered_artist_ids = params[:offering][:registered_artist_ids]    
    @locations = @offering.region.locations
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
    
  def change_region
    logger.info "#{params[:region_id]}************************"
    if (params[:region_id] == 0)
      @locations = []
    else
      @locations = Region.find(params[:region_id].to_i).locations
    end
    logger.info @locations.to_json
    render :text => @locations.to_json
    
  end

protected
  
  def load_variables
    @regions = Region.find(:all)
    @topics = Topic.find(:all)
    @types = Type.find(:all)
    @plans = Plan.find(:all)
  end

  
end
