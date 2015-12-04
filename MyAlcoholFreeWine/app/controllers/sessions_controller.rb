class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    customer_detail = CustomerDetail.find_by(email: params[:email])
    if customer_detail and customer_detail.authenticate(params[:password])
      session[:customer_detail_id] = customer_detail.id
      redirect_to wines_url
    else
      redirect_to login_url, alert: 'Invalid email/password combination'
    end
  end

  def destroy
    session[:customer_detail_id] = nil
    session[:basket_id] = nil
    redirect_to wines_url, notice: 'Logged out'
  end
end
