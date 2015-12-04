class RemoveOrderIdFromBasketItems < ActiveRecord::Migration
  def change
    remove_column :basket_items, :order_id
  end
end
