class WebServiceCallJob
  include SuckerPunch::Job

  def perform
    # Get the list of web services for Wine lists
    web_services_wine_lists = Rails.application.config.x.web_services_wine_lists
    web_services_wine_lists.each do |web_service|
       WebServiceCaller.new.update_web_service_wines(web_service[1])
    end

    WebServiceCallJob.new.async.later(40)
  end

  def later(sec)
    after(sec){ perform }
  end
end