require 'test_helper'

class ReceberEmailControllerTest < ActionController::TestCase
  test "should get success" do
    get :success
    assert_response :success
  end

end
