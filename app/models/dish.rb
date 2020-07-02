class Dish < ApplicationRecord
  has_many :menu_dishes
  has_many :menus, through: :menu_dishes
end
