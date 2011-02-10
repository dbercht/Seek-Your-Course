class SearchesController < ApplicationController
  def show
    
  end
  
  def create
    if (params[:offering][:type_ids] != nil)
      @offerings = Offering.find(:all, :conditions => ["type_id IN (?) and validated=? and title like ?", params[:offering][:type_ids], true, "%" + params[:offering][:title]+"%"])
    else
       @offerings = Offering.find(:all, :conditions => ["validated=? and title like ?", true, "%" + params[:offering][:title]+"%"])
     end
     if (params[:offering][:topic_ids] != nil)
      @topic_ids = params[:offering][:topic_ids].map{|i| i.to_i}
      for offering in @offerings do
        @ar = offering.topic_ids & @topic_ids
      end
      @offerings.delete_if{|x| ((x.topic_ids & @topic_ids) == []) }
    end
    
    @title = "Search Results"
    render "offerings/index"
  end
  
end