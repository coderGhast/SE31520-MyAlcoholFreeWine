class UpdateCustomerDetail < ActiveRecord::Migration
  def change
    rename_column :customer_details, :name, :email
  end
end
