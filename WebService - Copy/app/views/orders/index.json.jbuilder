json.array!(@orders) do |order|
  json.extract! order, :id, :customerEmail, :customerFirstname, :customerSurname, :customerPhone, :customerAddress, :productNumber, :quantity
  json.url order_url(order, format: :json)
end
