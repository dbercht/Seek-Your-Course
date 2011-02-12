class SearchesController < ApplicationController
  def index
    @search = Offering.new
    @topics = Topic.all
    @types = Type.all
  end
  
  def show
  end
  
  def results
    #Cleaning out search request by removing verb tenses and any exclamation points, etc And spaces are substituted by the sql delimiter
    clean_query(params[:offering][:title])
    logger.info "#{params[:offering][:title]}**************************"
    if (params[:offering][:type_ids] != nil) #If type was chosen
      @offerings = Offering.find(:all, :conditions => ["type_id IN (?) and validated=? and (title like ? or state like ?)", params[:offering][:type_ids], true, "%" + params[:offering][:title]+"%", "%" + params[:offering][:title]+"%"], :order => 'registration_deadline, registration_begins')
    else
       @offerings = Offering.find(:all, :conditions => ["validated=? and (title like ? or state like ?)", true, "%" + params[:offering][:title]+"%",  "%" + params[:offering][:title]+"%"], :order => 'registration_deadline, registration_begins')
    end
    if (params[:offering][:topic_ids] != nil) #if no topic was chosen
      @topic_ids = params[:offering][:topic_ids].map{|i| i.to_i}
      for offering in @offerings do
        @ar = offering.topic_ids & @topic_ids
      end
      @offerings.delete_if{|x| ((x.topic_ids & @topic_ids) == []) }
    end
    session[:offerings] = @offerings.map{|x| x.id}
    logger.info session[:offerings]
    @title = "Search Results"
    render "offerings/index"
  end
    
    
    private
  
    def clean_query(search_param)
      search_param.gsub!(/ /, "%")
      search_param.gsub!(/(((ing)|(ed)|(er))\b)|[^A-Za-z0-9%]/, "")
      logger.info "#{params[:offering][:title]}**************************"\
    end
    
end