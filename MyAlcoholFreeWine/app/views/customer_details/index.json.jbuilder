json.array!(@customer_details) do |customer_detail|
  json.extract! customer_detail, :id, :name
  json.url customer_detail_url(customer_detail, format: :json)
end
