require 'test_helper'

class AtletasControllerTest < ActionController::TestCase
  setup do
    @atleta = atletas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atletas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atleta" do
    assert_difference('Atleta.count') do
      post :create, atleta: { categoria: @atleta.categoria, codigo: @atleta.codigo, cpf: @atleta.cpf, data_de_nascimento: @atleta.data_de_nascimento, email: @atleta.email, endereco: @atleta.endereco, entidade_filiada: @atleta.entidade_filiada, nome: @atleta.nome, nome_da_mae: @atleta.nome_da_mae, nome_do_pai: @atleta.nome_do_pai, ranking: @atleta.ranking, rg: @atleta.rg }
    end

    assert_redirected_to atleta_path(assigns(:atleta))
  end

  test "should show atleta" do
    get :show, id: @atleta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atleta
    assert_response :success
  end

  test "should update atleta" do
    put :update, id: @atleta, atleta: { categoria: @atleta.categoria, codigo: @atleta.codigo, cpf: @atleta.cpf, data_de_nascimento: @atleta.data_de_nascimento, email: @atleta.email, endereco: @atleta.endereco, entidade_filiada: @atleta.entidade_filiada, nome: @atleta.nome, nome_da_mae: @atleta.nome_da_mae, nome_do_pai: @atleta.nome_do_pai, ranking: @atleta.ranking, rg: @atleta.rg }
    assert_redirected_to atleta_path(assigns(:atleta))
  end

  test "should destroy atleta" do
    assert_difference('Atleta.count', -1) do
      delete :destroy, id: @atleta
    end

    assert_redirected_to atletas_path
  end
end
