require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Instructor.new.valid?
  end
end
