class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :customerEmail, null:false
      t.string :customerFirstname, null:false
      t.string :customerSurname, null:false
      t.string :customerPhone, null:false
      t.string :customerAddress, null:false
      t.string :productNumber, null:false
      t.integer :quantity,null:false

      t.timestamps null: false

    end
  end
end
