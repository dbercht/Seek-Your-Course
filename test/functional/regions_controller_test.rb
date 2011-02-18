require 'test_helper'

class RegionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Region.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Region.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_edit
    get :edit, :id => Region.first
    assert_template 'edit'
  end

  def test_update_invalid
    Region.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Region.first
    assert_template 'edit'
  end

  def test_update_valid
    Region.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Region.first
    assert_redirected_to root_url
  end
end
