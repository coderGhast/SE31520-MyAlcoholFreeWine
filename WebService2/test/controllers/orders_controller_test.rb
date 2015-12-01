require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  # Test that we can add an order. Just check that we get a status OK (200) response back
  test 'should create order' do
    assert_difference('Order.count') do
      post :create, order: {customer_address: @order.customer_address, customer_email: @order.customer_email, customer_firstname: @order.customer_firstname, customer_phone: @order.customer_phone, customer_surname: @order.customer_surname, product_number: @order.product_number, quantity: @order.quantity }
    end

    assert_response(:success)
  end
end
