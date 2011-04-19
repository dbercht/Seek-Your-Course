require 'spec_helper'

describe "locations/show.html.erb" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :state => "State",
      :region_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
