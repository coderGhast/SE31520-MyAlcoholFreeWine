class AddCustomerToCustomerDetail < ActiveRecord::Migration
  def change
    add_reference :customer_details, :customer, index: true, foreign_key: true
  end
end
