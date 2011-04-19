require 'spec_helper'

describe Location do
  before(:each) do
    @location = Location.new(valid_location_hash) # grabs the hash below
  end

  it "should be valid" do
    @location.should be_valid
  end

  it "should not be valid with the same state in same region scope" do
    @location2 = Location.new(valid_location_hash) # grabs the hash below
    @location2.should_not be_valid
  end

  it "should be valid with the same state in different scope" do
    @location2 = Location.new(valid_location_hash) # grabs the hash below
    @location2.region_id = 2
    @location2.should be_valid
  end

  def valid_location_hash
    {:state => 'Alabama', :region_id => 1}
  end

end

