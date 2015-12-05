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
      post :create, customer_details: { email: 'joe@email.com', password: 'password',password_confirmation: 'secret' }
    end

    assert_redirected_to customer_details_path
  end

  test "should show customer_detail" do
    get :show, id: @customer_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_detail
    assert_response :success
  end

  test "should update customer_detail" do
    patch :update, id: @customer_detail, customer_detail: { name: @customer_detail.name, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to customer_details_path
  end

  test "should destroy customer_detail" do
    assert_difference('CustomerDetail.count', -1) do
      delete :destroy, id: @customer_detail
    end

    assert_redirected_to customer_details_path
  end
end
