class StaticController < ApplicationController
  def home
		#@featured = Offering.where(:featured => true).first
	#	@featured = Offering.where(" date( featured_date ) <= date( now( ) ) ORDER BY featured_date DESC LIMIT 1")
	@featured = Offering.find(:all, :conditions => [" date( featured_date ) <= date( now( ) )"]).order("date(featured_date) DESC").first

		#if !@potential.nil?
	#		@potential.update_attribute(:featured, true) unless @potential.nil?
#			@featured.update_attribute(:featured, false) unless @featured.nil?
#			@featured = @potential
#		end
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
