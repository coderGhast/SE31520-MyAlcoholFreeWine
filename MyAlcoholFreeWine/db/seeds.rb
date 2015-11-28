Wine.delete_all
# -----
Wine.create!(name: 'Bronco Bonus',
             description:
                 'A fantastic wine made from our finest white grapes and bull tail hair, made by hand, every time.',
             image_url: 'wine1.jpg',
             price: 10.90,
             country_of_origin: 'Spain',
             suitable_for_vegetarians: false,
             grape_type: 'white',
             bottle_size: '150ml',
            supplier: 'WebServiceA')
# -----
Wine.create!(name: 'Too Fancy For Alcohol',
             description:
                 'This wine is so fancy it even comes with a monocle.',
             image_url: 'wine2.jpg',
             price: 30.00,
             country_of_origin: 'France',
             suitable_for_vegetarians: true,
             grape_type: 'red',
             bottle_size: '200ml',
             supplier: 'WebServiceA')
# -----
Wine.create!(name: 'Fresh Prince of Grape Air',
             description:
                 'Stored upside down for extra freshness.',
             image_url: 'wine3.jpg',
             price: 5.49,
             country_of_origin: 'USA',
             suitable_for_vegetarians: true,
             grape_type: 'white',
             bottle_size: '100ml',
             supplier: 'WebServiceA')
# -----
Wine.create!(name: 'Constable\'s friend',
             description:
                 'Made for the policeman in all of us. Drink this when you\'re feeling adventurous.',
             image_url: 'wine4.jpg',
             price: 17.80,
             country_of_origin: 'United Kingdom',
             suitable_for_vegetarians: false,
             grape_type: 'red',
             bottle_size: '500ml',
             supplier: 'WebServiceB')