require 'test_helper'

class OfferingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Offering.new.valid?
  end
end
