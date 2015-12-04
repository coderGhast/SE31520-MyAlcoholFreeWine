class RemoveCustomerSurnameAndPhoneFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :customer_surname
    rename_column :orders, :customer_firstname, :customer_name
    remove_column :orders, :customer_phone
  end
end
