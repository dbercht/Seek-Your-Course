require 'spec_helper'

describe "topics/edit.html.erb" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :category => "MyString"
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path(@topic), :method => "post" do
      assert_select "input#topic_category", :name => "topic[category]"
    end
  end
end
