class Wine < ActiveRecord::Base
  validates :name, :description, :grape_type, :price, :country_of_origin, :bottle_size, :image_url, :supplier, presence: true;
  validates :name, uniqueness: true;
  validates :price, numericality: {greater_than_or_equal_to: 0.01};
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }

  # Own defined comparison method to see if a wine is the same, regardless of Product Number (supplier specific)
  def ==(another_wine)
    if self.name == another_wine['name']
      if self.country_of_origin == another_wine['country_of_origin']
        if self.price == another_wine['price']
          if self.grape_type == another_wine['grape_type']
            if self.suitable_for_vegetarians == another_wine['suitable_for_vegetarians']
              if self.bottle_size == another_wine['bottle_size']
                if self.description == another_wine['description']
                  if self.image_url == another_wine['image_url']
                    return true
                  end
                end
              end
            end
          end
        end
      end
    end

    return false
  end

  self.per_page = 5
end