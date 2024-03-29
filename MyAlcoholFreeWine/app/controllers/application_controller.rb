class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  # For each page, check if the client is meant to be there (pages there are okay without being logged in are white listed)
  protected
  def authorize
    unless CustomerDetail.find_by(id: session[:customer_detail_id])
      redirect_to login_url, notice: 'Please log in'
    end
  end

  # Get the customers email for displaying on the application view
  def get_customer_email
    CustomerDetail.find_by(id: session[:customer_detail_id])[:email]
  end
  helper_method :get_customer_email
end
