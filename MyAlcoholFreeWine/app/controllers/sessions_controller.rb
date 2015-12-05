# Code based/modified from Agile Web Development with Rails Book by Andreas Schwarz, Dave Thomas,
# David Heinemeier Hansson, James Duncan Davidson, Justin Gehtland, Leon Breedt, and Mike Clark
class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    customer_detail = CustomerDetail.find_by(email: params[:email])
    if customer_detail and customer_detail.authenticate(params[:password])
      session[:customer_detail_id] = customer_detail.id
      unless session[:return_to].blank?
        # If the user was somewhere important before (mainly, Basket before checkout but not logged in), return them
        redirect_to session.delete(:return_to)
      else
        redirect_to wines_url
      end
    else
      redirect_to login_url, alert: 'Invalid email/password combination'
    end
  end

  def destroy
    # At the end of a login session, delete the customer id and basket id from the session.
    session[:customer_detail_id] = nil
    unless session[:basket_id].blank?
      Basket.delete session[:basket_id]
      session[:basket_id] = nil
    end
    session[:return_to] = nil
    redirect_to wines_url, notice: 'Logged out'
  end
end
