class BasketItem < ActiveRecord::Base
  belongs_to :wine
  belongs_to :basket

  def total_price
    wine.price * quantity
  end
end
