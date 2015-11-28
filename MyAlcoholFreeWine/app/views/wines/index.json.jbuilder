json.array!(@wines) do |wine|
  json.extract! wine, :id, :name, :description, :suitable_for_vegetarians, :bottle_size, :country_of_origin, :grape_type, :supplier, :price, :image_url
  json.url wine_url(wine, format: :json)
end
