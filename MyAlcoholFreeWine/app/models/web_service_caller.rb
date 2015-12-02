class WebServiceCaller
  def update_web_service_wines(web_service_uri)
      resource = RestClient::Resource.new web_service_uri

      web_server_response = resource.get
      result = JSON.parse(web_server_response)

      result.each do |web_service_wine|
        web_service_wine.delete('url')
        web_service_wine['product_number'] = web_service_wine['id']
        web_service_wine.delete('id')

        wine_needs_update_or_create(web_service_wine)
      end
      delete_removed_wines(result)
  end

  private def wine_needs_update_or_create(web_service_wine)
    # Check if a wine with the same name exists
    existing_wine = Wine.find_by name: web_service_wine['name']
    # Check that the wine with that name already exists in the table, if not, create it
    if existing_wine.blank?
      web_service_wine_object = Wine.create(web_service_wine)
      web_service_wine_object.save!
    else
      # If the Wine is from a different supplier and cheaper, replace it.
      if web_service_wine['supplier'] != existing_wine[:supplier]
        if web_service_wine['price'].to_d < existing_wine[:price]
          existing_wine.update(web_service_wine)
        end
      end
      # update the attributes of the wine if something has changed (could be anything, update all - could be more efficient)
      if web_service_wine['supplier'] == existing_wine[:supplier]
        if existing_wine == web_service_wine
        else
          existing_wine.update(web_service_wine)
        end
      end
    end
  end

  private def delete_removed_wines(web_service_wines)
    wine_still_exists = false
    current_wines = Wine.all
    # For each wine we currently have
    current_wines.each do |current_wine|
      # If the Wine is from the provided supplier, we can remove it if needed
      if web_service_wines.first['supplier'] == current_wine['supplier']
        # Go through the wines we got from this supplier
        web_service_wines.each do |web_service_wine|
          # If the Wine ProductId doesn't exist anymore, this shouldn't become true and we can delete it
          if current_wine['name'] == web_service_wine['name']
            wine_still_exists = true
          end
        end
        unless wine_still_exists
          current_wine.delete
        end
      end
      wine_still_exists = false
    end
  end

  def send_wine_order
    resource = RestClient::Resource.new Rails.application.config.x.web_services_order_placements[:web_service_1]
    @response = resource.post(
        {:customer_email=> 'test2@email.com',
                   :customer_firstname => 'Joe',
                   :customer_surname => 'Bloggs',
                   :customer_phone => '051611219',
                   :customer_address => '50 Road, Place, Town',
                   :product_number =>'027502',
                   :quantity => 2}.to_json,
        :content_type => :json)

  end
end