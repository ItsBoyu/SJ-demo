# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Menu.create(name: 'Menu1')
Menu.create(name: 'Menu2')
m1 = Menu.find_by(name: 'Menu1')
m2 = Menu.find_by(name: 'Menu2')
m1.dishes.create(name: 'dish1', price: 180)
m1.dishes.create(name: 'dish2', price: 180)
m1.dishes.create(name: 'dish3', price: 180)
m2.dishes.create(name: 'dish4', price: 180)
m2.dishes.create(name: 'dish5', price: 180)
m2.dishes.create(name: 'dish6', price: 180)
