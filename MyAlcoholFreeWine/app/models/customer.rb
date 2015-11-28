class Customer < ActiveRecord::Base
  validates :firstname, :surname, :email, :address, presence: true;
  validates :email, uniqueness: true;
end
