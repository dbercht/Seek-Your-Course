require 'spec_helper'

describe Offering do

  before(:all) do
    Offering.destroy_all
    
    @offering = Factory(:offering) # grabs the hash below
  end

  it "should be valid" do

    @offering.should be_valid
  end

  it "should not be valid without any attributes" do
    @offering = Offering.new # grabs the hash below
    @offering.should_not be_valid
  end

  it "should not be valid with registration deadline before registration begins" do
    @offering.registration_deadline = @offering.registration_begins - 2.days
    @offering.should_not be_valid
  end

  it "should not be valid with start date before registration begins" do
    @offering.registration_deadline = @offering.start_date - 3.days
    @offering.should_not be_valid
  end

  def valid_location_hash
  end

  def topics
  end
end
