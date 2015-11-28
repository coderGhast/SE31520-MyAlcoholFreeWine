class AddDetailsToCustomer < ActiveRecord::Migration
  change_column_null :customers, :firstname, false
  change_column_null :customers, :surname, false
  change_column_null :customers, :email, false
  change_column_null :customers, :address, false
end
