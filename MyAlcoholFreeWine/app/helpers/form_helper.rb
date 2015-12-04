module FormHelper
  # When we make a new customer, we must make a new Customer in Customer Detail in order to show 'new' form for customer
  def setup_customer(customer_details)
    customer_details.customer ||= Customer.new
    customer_details
  end
end