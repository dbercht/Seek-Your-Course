class OfferingsController < ApplicationController
  before_filter :load_variables, :only => [:new, :create, :edit, :update]
  
  def index
    @title = "Offerings"
    @offerings = Offering.find(:all, :conditions => ["validated=?", true])
  end

  def show
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
  end

  def create
    @offering = Offering.new(params[:offering])
    @offering.contact = @contact
    if (@offering.valid? & @contact.valid?)
      @contact.save!
      @offering.save!
      flash[:notice] = "Successfully created offering."
      redirect_to @offering
    else
      render :action => 'new'
    end
  end

  def edit
    @offering = Offering.find(params[:id])
  end

  def update
    @offering = Offering.find(params[:id])
    if (@contact.update_attributes(params[:contact])  )    
      if(@offering.update_attributes(params[:offering]))
        flash[:notice] = "Successfully updated offering."
        redirect_to @offering
      else
        render :action => 'edit'
      end
    else
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
