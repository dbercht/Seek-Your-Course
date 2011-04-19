require 'spec_helper'

describe "locations/index.html.erb" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :state => "State",
        :region_id => 1
      ),
      stub_model(Location,
        :state => "State",
        :region_id => 1
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
