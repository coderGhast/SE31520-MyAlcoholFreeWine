class RemoveFirstnameAndSurnameFromCustomer < ActiveRecord::Migration
  def change
    rename_column :customers, :firstname, :name
    remove_column :customers, :surname
  end
end
