require 'spec_helper'

describe "offerings/edit.html.erb" do
  before(:each) do
    @offering = assign(:offering, stub_model(Offering,
      :title => "MyString",
      :location_id => 1,
      :specific_location => "MyString",
      :link => "MyString",
      :description => "MyString",
      :type_id => 1,
      :validated => false,
      :plan_id => 1,
      :note => "MyText",
      :coordinator_id => 1,
      :unregistered_artists => "MyText"
    ))
  end

  it "renders the edit offering form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => offerings_path(@offering), :method => "post" do
      assert_select "input#offering_title", :name => "offering[title]"
      assert_select "input#offering_location_id", :name => "offering[location_id]"
      assert_select "input#offering_specific_location", :name => "offering[specific_location]"
      assert_select "input#offering_link", :name => "offering[link]"
      assert_select "input#offering_description", :name => "offering[description]"
      assert_select "input#offering_type_id", :name => "offering[type_id]"
      assert_select "input#offering_validated", :name => "offering[validated]"
      assert_select "input#offering_plan_id", :name => "offering[plan_id]"
      assert_select "textarea#offering_note", :name => "offering[note]"
      assert_select "input#offering_coordinator_id", :name => "offering[coordinator_id]"
      assert_select "textarea#offering_unregistered_artists", :name => "offering[unregistered_artists]"
    end
  end
end
