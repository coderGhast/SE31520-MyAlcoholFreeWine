json.array!(@wines) do |wine|
  json.extract! wine, :id, :name, :description, :image_url, :price, :country_of_origin, :grape_type, :suitable_for_vegetarians, :bottle_size
  json.url wine_url(wine, format: :json)
  json.supplier :'Wine Supplier A'
end
