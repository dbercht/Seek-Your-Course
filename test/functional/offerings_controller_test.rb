require 'test_helper'

class OfferingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Offering.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Offering.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Offering.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to offering_url(assigns(:offering))
  end

  def test_edit
    get :edit, :id => Offering.first
    assert_template 'edit'
  end

  def test_update_invalid
    Offering.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Offering.first
    assert_template 'edit'
  end

  def test_update_valid
    Offering.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Offering.first
    assert_redirected_to offering_url(assigns(:offering))
  end

  def test_destroy
    offering = Offering.first
    delete :destroy, :id => offering
    assert_redirected_to offerings_url
    assert !Offering.exists?(offering.id)
  end
end
