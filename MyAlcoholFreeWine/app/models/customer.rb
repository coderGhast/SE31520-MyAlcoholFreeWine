class Customer < ActiveRecord::Base
  validates :name, :address, presence: true;
  validates :email, uniqueness: true;

  belongs_to :customer_detail
end
