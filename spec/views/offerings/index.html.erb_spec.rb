require 'spec_helper'

describe "offerings/index.html.erb" do
  before(:each) do
    assign(:offerings, [
      stub_model(Offering,
        :title => "Title",
        :location_id => 1,
        :specific_location => "Specific Location",
        :link => "Link",
        :description => "Description",
        :type_id => 1,
        :validated => false,
        :plan_id => 1,
        :note => "MyText",
        :coordinator_id => 1,
        :unregistered_artists => "MyText"
      ),
      stub_model(Offering,
        :title => "Title",
        :location_id => 1,
        :specific_location => "Specific Location",
        :link => "Link",
        :description => "Description",
        :type_id => 1,
        :validated => false,
        :plan_id => 1,
        :note => "MyText",
        :coordinator_id => 1,
        :unregistered_artists => "MyText"
      )
    ])
  end

  it "renders a list of offerings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Specific Location".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
