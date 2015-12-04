class CustomerDetail < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_secure_password

  belongs_to :customer
  accepts_nested_attributes_for :customer
end
