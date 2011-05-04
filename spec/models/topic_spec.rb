require 'spec_helper'

describe Topic do
  it "should be valid" do
    @topic = Factory(:topic)
    @topic.should be_valid
  end
  
  it "should not be valid with same non-unique category" do
    @topic = Factory(:topic)
    @topic2 = Topic.create(@topic.attributes)
    @topic2.should_not be_valid
  end
end
