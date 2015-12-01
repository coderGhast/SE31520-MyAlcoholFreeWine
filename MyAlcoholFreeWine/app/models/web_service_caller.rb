class WebServiceCaller
  @wine_still_exists = false

  def get_web_service_wines
    # Get the list of web services for Wine lists
    web_services_wine_lists = Rails.application.config.x.web_services_wine_lists
    web_services_wine_lists.each do |web_service|
      resource = RestClient::Resource.new web_service[1]
      #begin
        web_server_response = resource.get
        result = JSON.parse(web_server_response)

        result.each do |web_service_wine|
          web_service_wine['supplier'] = web_service[1]
          web_service_wine.delete('url')
          web_service_wine['product_number'] = web_service_wine['id']
          web_service_wine.delete('id')

          wine_needs_update_or_create(web_service_wine)
        end
        delete_removed_wines(result, web_service[1])
      #rescue
      #end
    end
  end

  private def wine_needs_update_or_create(web_service_wine)
    # Make a Wine to work with
    web_service_wine_object = Wine.create(web_service_wine)
    # Check if a wine from the same Supplier with the same ID already exists
    existing_wine = Wine.where(product_number: web_service_wine_object.product_number, supplier: web_service_wine_object.supplier).first
    # Check that the wine already exists in the table
    if existing_wine.blank?
      web_service_wine_object.save!
    else
      # update the attributes of the wine if something has changed (could be anything, update all - could be more efficient)
      if existing_wine != web_service_wine_object
        existing_wine.update(web_service_wine)
      end
    end
  end

  private def delete_removed_wines(web_service_wines, web_service_name)
    wine_still_exists = false
    current_wines = Wine.all
    # For each wine we currently have
    current_wines.each do |current_wine|
      # If the Wine is from the provided supplier, we can remove it if needed
      if web_service_name == current_wine['supplier']
        # Go through the wines we got from this supplier
        web_service_wines.each do |web_service_wine|
          # If the Wine ProductId doesn't exist anymore, this shouldn't become true and we can delete it
          if current_wine['product_number'] == web_service_wine['product_number']
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