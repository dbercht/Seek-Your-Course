class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  before_filter :load_ads
  
  private

    def load_ads
      @ads = load_ads_per_block(0, 4)
      @ads << load_ads_per_block(1, 6)
    end

    def load_ads_per_block(location, blocks)
      @ads_return = Array.new
      @all_ads = Ads.all(:conditions => ["position = ?", Ads::POSITIONS[location]]).sort_by{ rand }
      @blocks_so_far = 0
     
      if(@all_ads.size == 0)
        @blocks_so_far = blocks
      end

      while(@blocks_so_far != blocks)
        @ad = @all_ads.pop
        @blocks_so_far += @ad.height/130
        logger.debug(@blocks_so_far)
        if(@blocks_so_far<=blocks)
          @ads_return << @ad
        else
          @blocks_so_far -= @ad.height/130
        end
        if(@all_ads.size == 0)
          @blocks_so_far = blocks
        end
      end
      return @ads_return
    end

end
