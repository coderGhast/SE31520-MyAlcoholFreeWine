ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as(customer)
    session[:customer_detail_id] = customer_details(customer).id
  end
  def logout
    session.delete :customer_detail_id
  end
  def setup
    login_as :one if defined? session
  end
end
