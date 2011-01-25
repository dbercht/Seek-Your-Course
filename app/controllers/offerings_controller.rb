class OfferingsController < ApplicationController
  def index
    @offerings = Offering.all
  end

  def show
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
  end

  def create
    @offering = Offering.new(params[:offering])
    if @offering.save
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
