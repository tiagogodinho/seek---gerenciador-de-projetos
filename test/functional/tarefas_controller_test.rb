require 'test_helper'

class TarefasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tarefas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tarefa" do
    assert_difference('Tarefa.count') do
      post :create, :tarefa => { }
    end

    assert_redirected_to tarefa_path(assigns(:tarefa))
  end

  test "should show tarefa" do
    get :show, :id => tarefas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tarefas(:one).id
    assert_response :success
  end

  test "should update tarefa" do
    put :update, :id => tarefas(:one).id, :tarefa => { }
    assert_redirected_to tarefa_path(assigns(:tarefa))
  end

  test "should destroy tarefa" do
    assert_difference('Tarefa.count', -1) do
      delete :destroy, :id => tarefas(:one).id
    end

    assert_redirected_to tarefas_path
  end
end
