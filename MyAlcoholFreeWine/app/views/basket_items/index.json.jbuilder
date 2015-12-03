json.array!(@basket_items) do |basket_item|
  json.extract! basket_item, :id, :wine_id, :basket_id
  json.url basket_item_url(basket_item, format: :json)
end
