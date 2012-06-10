require 'test_helper'

class RelatorioControllerTest < ActionController::TestCase
  test "should get atleta" do
    get :atleta
    assert_response :success
  end

  test "should get arbitro" do
    get :arbitro
    assert_response :success
  end

  test "should get tecnico" do
    get :tecnico
    assert_response :success
  end

end
