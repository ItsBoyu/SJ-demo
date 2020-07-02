# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

m1 = Menu.create(name: 'Lunch')
m2 = Menu.create(name: 'Dinner', period: 'dinner')
m1.dishes.create(name: 'Uni', price: 11, img_url: 'https://ubin.io/cFk1zb')
m2.dishes.create(name: 'Shrimp', price: 6, img_url: 'https://ubin.io/st62vH')

d1 = Dish.create(name: 'Salmon', price: 9, img_url: 'https://ubin.io/58qd4A')
d2 = Dish.create(name: 'Avocado', price: 7, img_url: 'https://ubin.io/nC4Udr')

[d1, d2].each do |e|
  MenuDish.create(menu: m1, dish: e)
  MenuDish.create(menu: m2, dish: e)
end
