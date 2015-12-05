require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  fixtures :wines
  setup do
    @wine = wines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wines)
  end

  test "should show wine" do
    get :show, id: @wine
    assert_response :success
  end
end
