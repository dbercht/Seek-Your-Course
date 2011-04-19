require 'spec_helper'

describe "locations/new.html.erb" do
  before(:each) do
    assign(:location, stub_model(Location,
      :state => "MyString",
      :region_id => 1
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path, :method => "post" do
      assert_select "input#location_state", :name => "location[state]"
      assert_select "input#location_region_id", :name => "location[region_id]"
    end
  end
end
