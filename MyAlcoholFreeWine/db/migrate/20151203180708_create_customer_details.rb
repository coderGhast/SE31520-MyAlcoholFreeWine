class CreateCustomerDetails < ActiveRecord::Migration
  def change
    create_table :customer_details do |t|
      t.string :name
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
