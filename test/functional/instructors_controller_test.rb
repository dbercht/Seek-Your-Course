require 'test_helper'

class InstructorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Instructor.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Instructor.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Instructor.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to instructor_url(assigns(:instructor))
  end

  def test_edit
    get :edit, :id => Instructor.first
    assert_template 'edit'
  end

  def test_update_invalid
    Instructor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Instructor.first
    assert_template 'edit'
  end

  def test_update_valid
    Instructor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Instructor.first
    assert_redirected_to instructor_url(assigns(:instructor))
  end

  def test_destroy
    instructor = Instructor.first
    delete :destroy, :id => instructor
    assert_redirected_to instructors_url
    assert !Instructor.exists?(instructor.id)
  end
end
