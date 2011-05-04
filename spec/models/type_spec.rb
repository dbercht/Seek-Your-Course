require 'spec_helper'

describe Type do
  it "should be valid" do
    @type = Factory(:type)
    @type.should be_valid
  end

  it "should not be valid with non-unique category" do
    @type = Factory(:type)
    @type2 = Type.create(@type.attributes)
    @type2.should_not be_valid
  end
end
