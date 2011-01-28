class OfferingsController < ApplicationController
  def index
    @offerings = Offering.find(:all, :conditions => ["validated=?", true])
  end

  def show
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
    @topics = Topic.find(:all, :order => 'category')
    @types = Type.find(:all, :order => 'category')
  end

  def create
    @offering = Offering.new(params[:offering])
    @offering.validated = false
    if @offering.save
      flash[:notice] = "Successfully created offering."
      redirect_to @offering
    else
      @topics = Topic.find(:all, :order => 'category')
      @types = Type.find(:all, :order => 'category')
      render :action => 'new'
    end
  end

  def edit
    @offering = Offering.find(params[:id])
    @topics = Topic.find(:all, :order => 'category')
    @types = Type.find(:all, :order => 'category')
  end

  def update
    @offering = Offering.find(params[:id])
    if @offering.update_attributes(params[:offering])
      flash[:notice] = "Successfully updated offering."
      redirect_to @offering
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
end
