class AdsController < ApplicationController
  before_filter :admin_required, :except => [:index]
  def index
    @ads = Ads.all
  end

  def new
    @ad = Ads.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  def edit
    @ad = Ads.find(params[:id])
  end

  def create
    @ad = Ads.new(params[:ads])

    respond_to do |format|
      if @ad.save
        format.html { redirect_to(ads_path, :notice => 'Ad was successfully created.') }
        format.xml  { render :xml => @ad, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ad = Ads.find(params[:id])

    respond_to do |format|
      if @ad.update_attributes(params[:ads])
        format.html { redirect_to(ads_path, :notice => 'Ad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ad = Ads.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to(ads_url) }
      format.xml  { head :ok }
    end
  end
end
