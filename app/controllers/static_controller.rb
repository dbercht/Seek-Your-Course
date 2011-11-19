class StaticController < ApplicationController
  def home
		#@featured = Offering.where(:featured => true).first
		@featured = Offering.first :conditions => ["featured_date >= ?",Date.today], :order => "featured_date"
		
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
