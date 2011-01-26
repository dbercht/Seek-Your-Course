require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Type.new.valid?
  end
end
