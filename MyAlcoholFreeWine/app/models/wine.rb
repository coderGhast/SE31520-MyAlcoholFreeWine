class Wine < ActiveRecord::Base
  searchable :auto_index => false do
    text :name
    text :description
    text :grape_type
    text :country_of_origin
    text :bottle_size
    text :supplier

    boolean :suitable_for_vegetarians
    text  :price
  end

  has_many :basket_items
  before_destroy :ensure_not_referenced_by_any_line_item

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
          else if self.price == another_wine['price'].to_d
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

  private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if basket_items.empty?
        return true
        else
            errors.add(:base, 'Basket Items present')
            return false
            end
    end
end