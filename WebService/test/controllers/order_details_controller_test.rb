require 'test_helper'

class OrderDetailsControllerTest < ActionController::TestCase
  setup do
    @order_detail = order_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_detail" do
    assert_difference('OrderDetail.count') do
      post :create, order_detail: { customerAddress: @order_detail.customerAddress, customerEmail: @order_detail.customerEmail, customerFirstname: @order_detail.customerFirstname, customerPhone: @order_detail.customerPhone, customerSurname: @order_detail.customerSurname, productNumber: @order_detail.productNumber, quantity: @order_detail.quantity }
    end

    assert_redirected_to order_detail_path(assigns(:order_detail))
  end

  test "should show order_detail" do
    get :show, id: @order_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_detail
    assert_response :success
  end

  test "should update order_detail" do
    patch :update, id: @order_detail, order_detail: { customerAddress: @order_detail.customerAddress, customerEmail: @order_detail.customerEmail, customerFirstname: @order_detail.customerFirstname, customerPhone: @order_detail.customerPhone, customerSurname: @order_detail.customerSurname, productNumber: @order_detail.productNumber, quantity: @order_detail.quantity }
    assert_redirected_to order_detail_path(assigns(:order_detail))
  end

  test "should destroy order_detail" do
    assert_difference('OrderDetail.count', -1) do
      delete :destroy, id: @order_detail
    end

    assert_redirected_to order_details_path
  end
end
