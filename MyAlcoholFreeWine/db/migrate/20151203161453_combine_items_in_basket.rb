class CombineItemsInBasket < ActiveRecord::Migration
  def up
    # replace multiple items for a single product in a cart with a single item
    Basket.all.each do |basket|
      # count the number of each product in the cart
      sums = basket.basket_items.group(:wine_id).sum(:quantity)
      sums.each do |wine_id, quantity|
        if quantity > 1
          # remove individual items
          basket.basket_items.where(wine_id: wine_id).delete_all
          # replace with a single item
          item = basket.basket_items.build(wine_id: wine_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
