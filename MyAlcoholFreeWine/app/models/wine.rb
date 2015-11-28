class Wine < ActiveRecord::Base
  validates :name, :description, :grape_type, :price, :country_of_origin, :bottle_size, :image_url, :supplier, presence: true;
  validates :name, uniqueness: true;
  validates :price, numericality: {greater_than_or_equal_to: 0.01};
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }

  self.per_page = 5
end