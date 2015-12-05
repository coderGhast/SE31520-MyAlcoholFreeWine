require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  fixtures :customer_details

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    someone = customer_details(:one)
    post :create, email: someone.email, password: 'secret'

    assert_equal someone.id, session[:customer_detail_id]
    assert_redirected_to wines_url
  end

  test "should fail login" do
    someone = customer_details(:one)
    post :create, email: someone.email, password: 'badpass'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to wines_url
  end

end
