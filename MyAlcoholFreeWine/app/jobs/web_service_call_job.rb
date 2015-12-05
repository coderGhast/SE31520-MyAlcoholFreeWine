class WebServiceCallJob
  include SuckerPunch::Job
  attr_accessor :last_request_time

  def perform
    # Get the list of web services for Wine lists
    web_services_wine_lists = Rails.application.config.x.web_services_wine_lists
    web_services_wine_lists.each do |web_service|
      # Call each web service, with info on when we last made a request
       WebServiceCaller.new.update_web_service_wines(web_service[1], @last_request_time)
    end
    # Since we just finished our requests to the web services, update our time
    @last_request_time = Time.now
  end
end