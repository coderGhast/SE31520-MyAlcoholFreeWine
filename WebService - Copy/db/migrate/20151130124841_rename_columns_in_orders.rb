class RenameColumnsInOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.rename :customerEmail, :customer_email
      t.rename :customerFirstname, :customer_firstname
      t.rename :customerSurname, :customer_surname
      t.rename :customerPhone, :customer_phone
      t.rename :customerAddress, :customer_address
      t.rename :productNumber, :product_number
    end
  end
end
