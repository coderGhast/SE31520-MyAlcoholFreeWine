require 'test_helper'

class WineTest < ActiveSupport::TestCase
  setup 'setup' do
  @wine = Wine.new(name: 'Fancy Wine',
                    description: 'Amazing wine by amazing people just for you',
                    price: 10.00,
                    bottle_size:'150ml',
                    country_of_origin: 'USA',
                    grape_type:'White',
                    image_url: 'wine.jpg',
                    suitable_for_vegetarians: 'true');
  end

  test 'wine attributes must not be empty' do
    wine = Wine.new
    assert wine.invalid?
    assert wine.errors[:name].any?
    assert wine.errors[:description].any?
    assert wine.errors[:country_of_origin].any?
    assert wine.errors[:grape_type].any?
    assert wine.errors[:bottle_size].any?
    assert wine.errors[:price].any?
    assert wine.errors[:image_url].any?
  end

  test 'wine price must not be negative' do
    wine = @wine;
    wine.price = -1
    assert wine.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 wine.errors[:price]
  end

  test 'wine price must not be zero' do
    wine = @wine;
    wine.price = 0
    assert wine.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 wine.errors[:price]
  end

  test 'wine price must be positive' do
    wine = @wine;
    wine.price = 1
    assert wine.valid?
  end

end
