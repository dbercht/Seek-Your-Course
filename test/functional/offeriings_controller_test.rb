require 'test_helper'

class OfferiingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Offeriing.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Offeriing.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Offeriing.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to offeriing_url(assigns(:offeriing))
  end

  def test_edit
    get :edit, :id => Offeriing.first
    assert_template 'edit'
  end

  def test_update_invalid
    Offeriing.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Offeriing.first
    assert_template 'edit'
  end

  def test_update_valid
    Offeriing.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Offeriing.first
    assert_redirected_to offeriing_url(assigns(:offeriing))
  end

  def test_destroy
    offeriing = Offeriing.first
    delete :destroy, :id => offeriing
    assert_redirected_to offeriings_url
    assert !Offeriing.exists?(offeriing.id)
  end
end
