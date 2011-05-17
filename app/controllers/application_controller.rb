class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  before_filter :load_ads
  

  def load_ads
    @ads = Ads.all
  end

end
