require 'spec_helper'

describe "locations/edit.html.erb" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :state => "MyString",
      :region_id => 1
    ))
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path(@location), :method => "post" do
      assert_select "input#location_state", :name => "location[state]"
      assert_select "input#location_region_id", :name => "location[region_id]"
    end
  end
end
