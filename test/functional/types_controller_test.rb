require 'test_helper'

class TypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Type.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Type.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Type.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to type_url(assigns(:type))
  end

  def test_edit
    get :edit, :id => Type.first
    assert_template 'edit'
  end

  def test_update_invalid
    Type.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Type.first
    assert_template 'edit'
  end

  def test_update_valid
    Type.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Type.first
    assert_redirected_to type_url(assigns(:type))
  end

  def test_destroy
    type = Type.first
    delete :destroy, :id => type
    assert_redirected_to types_url
    assert !Type.exists?(type.id)
  end
end
