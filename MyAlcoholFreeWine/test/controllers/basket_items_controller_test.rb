require 'test_helper'

class BasketItemsControllerTest < ActionController::TestCase
  fixtures :wines
  setup do
    @basket_item = basket_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basket_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basket_item" do
    assert_difference('BasketItem.count') do
      post :create, wine_id: wines(:fancy).id
    end

    assert_redirected_to basket_path(assigns(:basket_item).basket)
  end

  test "should show basket_item" do
    get :show, id: @basket_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basket_item
    assert_response :success
  end

  test "should update basket_item" do
    patch :update, id: @basket_item, basket_item: { wine_id: @basket_item.wine_id }
    assert_redirected_to basket_item_path(assigns(:basket_item))
  end

  test "should destroy basket_item" do
    request.env['HTTP_REFERER'] = baskets_path
    assert_difference('BasketItem.count', -1) do
      delete :destroy, id: @basket_item
    end
  end

  test "should_send_us_back_to_where_we_were_after_destroy_basket_item" do
    request.env['HTTP_REFERER'] = baskets_path
    delete :destroy, id: @basket_item
    assert_redirected_to baskets_path
  end
end
