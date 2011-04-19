require 'spec_helper'

describe "topics/index.html.erb" do
  before(:each) do
    assign(:topics, [
      stub_model(Topic,
        :category => "Category"
      ),
      stub_model(Topic,
        :category => "Category"
      )
    ])
  end

  it "renders a list of topics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
