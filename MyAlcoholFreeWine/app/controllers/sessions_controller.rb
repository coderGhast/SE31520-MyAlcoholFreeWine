class SessionsController < ApplicationController
  def new
  end

  def create
    customer_detail = CustomerDetail.find_by(email: params[:email])
    if customer_detail and customer_detail.authenticate(params[:password])
      session[:customer_detail_id] = customer_detail.id
      # redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
  end
end
