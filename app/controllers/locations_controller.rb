class LocationsController < ApplicationController
  before_filter :admin_required, :except => [:index, :show]
  before_filter :load_regions, :except => [:index, :show]

  # GET /locations
  # GET /locations.xml
  def index
    @region = Region.find(params[:region_id])
    @locations = @region.locations
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @region = Region.find(params[:region_id])
    @location = @region.locations.find(params[:id])
    @offerings = @location.offerings

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @region = Region.find(params[:region_id])
    @location = @region.locations.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @region = Region.find(params[:region_id])
    @location = @region.locations.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @region = Region.find(params[:region_id])
    @location = @region.locations.build(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to(region_location_path(@region, @location), :notice => 'Location was successfully created.') }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @region = Region.find(params[:region_id])
    @location = @region.locations.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to(region_locations_path(@region), :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @region = Region.find(params[:region_id])
    @location = @region.locations.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(region_locations_path(@region)) }
      format.xml  { head :ok }
    end
  end

  private
    def load_regions
      @regions = Region.all
    end
end
