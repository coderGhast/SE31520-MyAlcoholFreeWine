# Store links to Web Services in config
Rails.application.config.x.web_services_wine_lists = {:web_service_1 => 'localhost:3001/wines.json', :web_service_2 => 'localhost:3002/wines.json'}
Rails.application.config.x.web_services_order_placements = {:web_service_1 => 'localhost:3001/orders', :web_service_2 => 'localhost:3002/orders'}