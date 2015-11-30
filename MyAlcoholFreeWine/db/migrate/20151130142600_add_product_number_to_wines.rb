class AddProductNumberToWines < ActiveRecord::Migration
  add_column :wines, :product_number, :integer
end
