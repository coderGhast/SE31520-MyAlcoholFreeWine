class AddOrderToBasketItem < ActiveRecord::Migration
  def change
    add_reference :basket_items, :order, index: true, foreign_key: true
  end
end
