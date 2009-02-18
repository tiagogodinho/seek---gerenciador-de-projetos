require 'test_helper'

class PessoasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pessoas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pessoa" do
    assert_difference('Pessoa.count') do
      post :create, :pessoa => { }
    end

    assert_redirected_to pessoa_path(assigns(:pessoa))
  end

  test "should show pessoa" do
    get :show, :id => pessoas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pessoas(:one).id
    assert_response :success
  end

  test "should update pessoa" do
    put :update, :id => pessoas(:one).id, :pessoa => { }
    assert_redirected_to pessoa_path(assigns(:pessoa))
  end

  test "should destroy pessoa" do
    assert_difference('Pessoa.count', -1) do
      delete :destroy, :id => pessoas(:one).id
    end

    assert_redirected_to pessoas_path
  end
end
