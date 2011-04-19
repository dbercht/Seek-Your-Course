require 'spec_helper'

describe "types/index.html.erb" do
  before(:each) do
    assign(:types, [
      stub_model(Type,
        :category => "Category"
      ),
      stub_model(Type,
        :category => "Category"
      )
    ])
  end

  it "renders a list of types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
