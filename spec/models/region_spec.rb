require 'spec_helper'

describe Region do
  it "should be valid" do
    @region = Factory(:region_na)
    @region.should be_valid
  end
  
  it "should not be valid" do
    @region = Factory(:region_na)
    @region2 = Factory(:region_asia)
    @region2.should be_valid
  end
end
