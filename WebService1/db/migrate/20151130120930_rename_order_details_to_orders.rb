class RenameOrderDetailsToOrders < ActiveRecord::Migration
  def self.up
    rename_table :order_details, :orders
  end

  def self.down
    rename_table :order_details, :orders
  end
end
