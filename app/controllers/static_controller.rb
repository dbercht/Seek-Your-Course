class StaticController < ApplicationController
  def home
    render :layout => false
  end

  def ads
    render :layout => false
  end 

  def about
    render :layout => false
  end

  def contact
    render :layout => false
  end
end
