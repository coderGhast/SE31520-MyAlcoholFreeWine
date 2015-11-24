class Customer < ActiveRecord::Base
  has_many(:order_details);
end
