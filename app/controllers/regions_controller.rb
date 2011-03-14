class RegionsController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :edit, :update, :destroy]
 
  def index
    @regions = Region.all
  end
 
  def new
    @region = Region.new
  end

  def create
    @region = Region.new(params[:region])
    if @region.save
      flash[:notice] = "Successfully created region."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update_attributes(params[:region])
      flash[:notice] = "Successfully updated region."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
