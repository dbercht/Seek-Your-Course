require 'spec_helper'

describe Offering do

  def plan
    case :plan_id
      when 1
        return "Basic"
      when 2
        return "Pro 1"
      when 3
        return "Pro 2"
      end
  end
  before(:each) do
    @offering = Offering.new(valid_location_hash) # grabs the hash below
    @topic = Topic.new(:category => "Type", :id => 1) # grabs the hash 
    @offering.topics << @topic
  end

  it "should be valid" do
    @offering.should be_valid
  end

  it "should not be valid without any attributes" do
    @location = Location.new
    @location.should_not be_valid
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
    {:coordinator_id => 1, 
	:title => "Title",
	:type_id => 1,
	 :id => 1, 
	:registration_begins => Date.today, 
	:registration_deadline => Date.today + 1.days, 
	:start_date => Date.today + 2.days, 
	:location_id => 1, 
	:plan_id => 1, 
	:link => 'www.google.com', 
	:description => 'Short description'}
  end

  def topics
  end
end
