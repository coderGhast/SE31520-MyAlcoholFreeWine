class WebServiceCaller
  attr_reader :web_service_uris
  attr_reader :wine_list_uris
  attr_reader :order_post_uris
  @wine_still_exists = false

  def initialize
    @web_service_uris = {:web_service_1 => 'localhost:3001'}
    @wine_list_uris = {:web_service_1 => '/wines.json'}
    @order_post_uris = {:web_service_1 => '/order_details'}
  end

  def get_web_service_wines
    resource = RestClient::Resource.new (@web_service_uris[:web_service_1] + @wine_list_uris[:web_service_1])
    @response = resource.get

    @result = JSON.parse(@response)

    @result.each do |new_wine|
      new_wine['image_url'] = @web_service_uris[:web_service_1] + '/assets/' + new_wine['image_url']
      new_wine['supplier'] = @web_service_uris[:web_service_1]
      new_wine.delete('url')
      new_wine.delete('id')

      @thing = Wine.create(new_wine)
      if(Wine.find_by name: @thing.name)
        # Do something with price
      else
        @thing.save
      end
    end

    delete_removed_wines(@result)

  end

  private def delete_removed_wines(web_service_wines)
    @current_wines = Wine.all
    @current_wines.each do |current_wine|
      web_service_wines.each do |new_wine|
        if current_wine['name'] == new_wine['name']
          @wine_still_exists = true
        end
      end
      unless @wine_still_exists
        current_wine.delete
      end
      @wine_still_exists = false
    end
  end

  def send_wine_order
    resource = RestClient::Resource.new @order_post_uris
    @response = resource.post(
        {:customerEmail=> 'test2@email.com',
                   :customerFirstname => 'Joe',
                   :customerSurname => 'Bloggs',
                   :customerPhone => '051611219',
                   :customerAddress => '50 Road, Place, Town',
                   :productNumber =>'027502',
                   :quantity => 2}.to_json,
        :content_type => :json)

  end
end