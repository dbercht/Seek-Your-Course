require 'spec_helper'

describe "types/show.html.erb" do
  before(:each) do
    @type = assign(:type, stub_model(Type,
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Category/)
  end
end
