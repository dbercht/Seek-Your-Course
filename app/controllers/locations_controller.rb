class LocationsController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :load_variables, :only => [:new, :create, :edit, :update]
  
  def index
    @us_locations = Location.us_locations
    @abroad_locations = Location.abroad_locations
  end
  
  def show
    @location = Location.find(params[:id])
    @title = @location.state
    @offerings = @location.offerings
    render "offerings/index"
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:notice] = "Successfully created location."
      redirect_to locations_url
    else
      render :action => 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      flash[:notice] = "Successfully updated location."
      redirect_to locations_url
    else
      render :action => 'edit'
    end
  end
  
  protected 
  
    def load_variables
      @regions = Region.all
    end
    
  
end
