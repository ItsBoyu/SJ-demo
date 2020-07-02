# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

m1 = Menu.create(name: 'Lunch')
m2 = Menu.create(name: 'Dinner', period: 'dinner')
m1.dishes.create(name: 'Spicy Octopus', price: 11)
m2.dishes.create(name: 'Tofu Pocket', price: 4)

d1 = Dish.create(name: 'Sweet Tofu', price: 9)
d2 = Dish.create(name: 'Avocado', price: 7)

[d1, d2].each do |e|
  MenuDish.create(menu: m1, dish: e)
  MenuDish.create(menu: m2, dish: e)
end
