class Wine < ActiveRecord::Base
  searchable do
    text :name, :as => :name_textp
    text :description, :as => :description_textp
    text :grape_type, :as => :grape_type_textp

    #boolean :suitable_for_vegetarians
    #double  :price
  end

  validates :name, :description, :grape_type, :price, :country_of_origin, :bottle_size, :image_url, :supplier, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01};
  validates :name, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }


  # How many wines to display per page (for will_paginate)
  self.per_page = 6


  # Own defined comparison method to see if a wine is the same, regardless of Product Number (supplier specific)
  def ==(another_wine)
    if self.supplier == another_wine['supplier']
      else if self.name == another_wine['name']
        else if self.country_of_origin == another_wine['country_of_origin']
          else if self.price == another_wine['price']
            else if self.grape_type == another_wine['grape_type']
              else if self.suitable_for_vegetarians == another_wine['suitable_for_vegetarians']
                else if self.bottle_size == another_wine['bottle_size']
                  else if self.description == another_wine['description']
                    else if self.image_url == another_wine['image_url']
                      return true
                    end
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
end