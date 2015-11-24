json.array!(@customers) do |customer|
  json.extract! customer, :id, :surname, :firstname, :phone, :email
  json.url customer_url(customer, format: :json)
end
