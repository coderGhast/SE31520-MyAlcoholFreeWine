# Code based/modified from Agile Web Development with Rails Book by Andreas Schwarz, Dave Thomas,
# David Heinemeier Hansson, James Duncan Davidson, Justin Gehtland, Leon Breedt, and Mike Clark

class Basket < ActiveRecord::Base
  has_many :basket_items, dependent: :destroy

  def add_wine(wine_id)
    current_item = basket_items.find_by(wine_id: wine_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = basket_items.build(wine_id: wine_id)
    end
    current_item
  end

  def total_price
    basket_items.to_a.sum { |item| item.total_price }
  end
end
