require 'test_helper'

class WineTest < ActiveSupport::TestCase
  fixtures :wines
  # Test our custom equality check passes with a hash that matches the Wine
  test 'wine_should_be_the_same' do
    wine = wines(:fancy)
    wine_hash ={'name' => 'FancyWine', 'product_number' => 3, 'price' => '9.99', 'image_url' => 'wine.jpg', 'bottle_size' => '300ml', 'supplier' => "Wine People",
                     'grape_type' => 'White', 'country_of_origin' => 'France', 'description' => 'Fancy Wine for fancy people', 'suitable_for_vegetarians' => false}

    assert_equal(true, wine==wine_hash)
  end

  # Test that a hash that doesn't match our wine in one area doesn't pass the equality check
  test 'wine_should_not_be_the_same' do
    wine = wines(:fancy)
    wine_hash ={'name' => 'WRONG', 'product_number' => 3, 'price' => '9.99', 'image_url' => 'wine.jpg', 'bottle_size' => '300ml', 'supplier' => "Wine People",
                'grape_type' => 'White', 'country_of_origin' => 'France', 'description' => 'Fancy Wine for fancy people', 'suitable_for_vegetarians' => false}

    assert_equal(false, wine==wine_hash)
  end
end
