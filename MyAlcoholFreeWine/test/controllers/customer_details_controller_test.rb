require 'test_helper'

class CustomerDetailsControllerTest < ActionController::TestCase
  fixtures :customer_details

  setup do
    @customer_detail = customer_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_detail" do
    assert_difference('CustomerDetail.count') do
      post :create, customer_detail: { email: 'suchruby@email.com', password: 'secret',password_confirmation: 'secret', customer_attributes: {name: 'joe', address: 'whatever'} }
    end

    assert_redirected_to wines_url
  end

  test "should show customer_detail" do
    get :show, id: @customer_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_detail
    assert_response :success
  end

  test "should destroy customer_detail" do
    assert_difference('CustomerDetail.count', -1) do
      delete :destroy, id: @customer_detail
    end

    assert_redirected_to customer_details_path
  end
end
