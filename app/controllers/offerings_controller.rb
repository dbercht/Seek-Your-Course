class OfferingsController < ApplicationController
  def index
    @offerings = Offering.find(:all, :conditions => ["validated=?", true])
  end

  def show
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
    @contact = Contact.new
    @topics = Topic.find(:all, :order => 'category')
    @types = Type.find(:all, :order => 'category')
  end

  def create
    @offering = Offering.new(params[:offering])
    @offering.validated = false
    @contact = Contact.new(params[:contact])
    @offering.contact = @contact
    if (@offering.valid? & @contact.valid?)
      @contact.save!
      @offering.save!
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
    @contact = @offering.contact
    @topics = Topic.find(:all, :order => 'category')
    @types = Type.find(:all, :order => 'category')
  end

  def update
    @offering = Offering.find(params[:id])
    @contact = @offering.contact
    @topics = Topic.find(:all, :order => 'category')
    @types = Type.find(:all, :order => 'category')
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
  
  def  locations
    
  end
end
