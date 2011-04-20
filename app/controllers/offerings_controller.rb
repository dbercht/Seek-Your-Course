class OfferingsController < ApplicationController
  before_filter :login_required, :only => [:new, :create, :edit, :update]
  before_filter :authorize, :only => [:edit, :update]
  before_filter :load_variables, :except => [:show, :index]
  before_filter :admin_required, :only => [:pending_index]
  
  # GET /offerings
  # GET /offerings.xml
  def index
    @offerings = Offering.validated(:all, :include => [:location])
    logger.debug @offerings
    respond_to do |format|
      format.html {@title = "Offerings"} # index.html.erb
      format.xml  { render :xml => @offerings }
    end
  end

  def pending_index
    @offerings = Offering.pending(:all, :include => [:location])
    respond_to do |format|
      format.html do
        @title = "Pending Offerings"
        render :action => 'index' # index.html.erb
      end
      format.xml  { render :xml => @offerings }
    end
  end


  # GET /offerings/1
  # GET /offerings/1.xml
  def show
    @offering = Offering.find(params[:id], :include => [:location, :region, :coordinator])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offering }
    end
  end

  # GET /offerings/new
  # GET /offerings/new.xml
  def new
    @offering = current_user.coordinated_offerings.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offering }
    end
  end

  # GET /offerings/1/edit
  def edit
    @offering = Offering.find(params[:id])
  end

  # POST /offerings
  # POST /offerings.xml
  def create
    @offering = current_user.coordinated_offerings.create(params[:offering])

    respond_to do |format|
      if @offering.save
        format.html { redirect_to(@offering, :notice => 'Offering was successfully created.') }
        format.xml  { render :xml => @offering, :status => :created, :location => @offering }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offering.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offerings/1
  # PUT /offerings/1.xml
  def update
    @offering = Offering.find(params[:id])
    if(current_admin)
      @offering.validated = params[:offering][:validated]
      @offering.note = params[:offering][:note]
    end
    respond_to do |format|
      if @offering.update_attributes(params[:offering])
        format.html { redirect_to(@offering, :notice => 'Offering was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offering.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1
  # DELETE /offerings/1.xml
  def destroy
    @offering = Offering.find(params[:id])
    @offering.destroy

    respond_to do |format|
      format.html { redirect_to(offerings_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    def load_variables
      @types = Type.all
      @topics = Topic.all
      @locations = Location.all
      @plans = Plan.all
    end

    def authorize
      if(current_admin)
        Offering.find(params[:id])
      else
        current_user.coordinated_offerings.find(params[:id])
      end
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url, :notice => "Cannot edit this offering"
    end

end
