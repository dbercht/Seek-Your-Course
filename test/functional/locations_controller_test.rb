require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Location.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Location.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to locations_url
  end

  def test_edit
    get :edit, :id => Location.first
    assert_template 'edit'
  end

  def test_update_invalid
    Location.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Location.first
    assert_template 'edit'
  end

  def test_update_valid
    Location.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Location.first
    assert_redirected_to locations_url
  end
end
