class WebServiceCaller

  def update_web_service_wines(web_service_uri, last_request_time)
    # Make a GET request for the provided web service uri and send a header with the last time we made a request
    # Since we only want new updates to save ourselves from accessing our DB and going through every item, this
    # lets the web service deal with which wines to tell us need updating. The first time this is sent, it's blank,
    # so we hope the web services will return us everything.
    begin
      web_server_response = RestClient.get(web_service_uri, 'LAST_REQUEST_TIME' => last_request_time )
      result = JSON.parse(web_server_response)
      # For each wine from the web service, remove the url it came from, add a product number based on the id from
      # the web service and then delete it.
      result.each do |web_service_wine|
        web_service_wine.delete('url')
        web_service_wine['product_number'] = web_service_wine['id']
        web_service_wine.delete('id')

        # With this hash of the web service wine, check if we need to update anything or create a new wine.
        wine_needs_update_or_create(web_service_wine)
      end
      unless result.blank?
        # This feature did delete any wines not sent to us, but since I changed the code to now only be sent wines that
        # have been updated, it would just delete every wine except those updated. What should instead be done is to
        # use a flag for STATUS on each wine, to say if it's in stock, out of stock or discontinued.
        #delete_removed_wines(result)
      end
    rescue
# ignored
    end
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

  def send_wine_order(customer, basket)
    basket.basket_items.each do |item|
      resource = get_web_service_address(item.wine[:supplier])
      unless resource.blank?
        resource.post(
            {:customer_email => customer[:email],
             :customer_name => customer[:name],
             :customer_address => customer[:address],
             :product_number => item.wine[:product_number],
             :quantity => item[:quantity]}.to_json,
            :content_type => :json)
      end
    end
  end

  private
  def get_web_service_address(supplier_name)
    if supplier_name == 'Wine Supplier A'
      RestClient::Resource.new Rails.application.config.x.web_services_order_placements[:web_service_1]
    else if supplier_name == 'Wine Supplier B'
      RestClient::Resource.new Rails.application.config.x.web_services_order_placements[:web_service_2]
         end
    end
  end
end