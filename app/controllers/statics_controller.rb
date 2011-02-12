class StaticsController < ApplicationController
  def home
    @search = Search.new
    @topics = Topic.all
    @types = Type.all
  end
  
  def who_we_are
  end
  
  def advertising
  end
  
  def contact_us
  end
  
end
