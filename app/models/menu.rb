class Menu < ApplicationRecord
  enum period: %i[lunch dinner]

  has_many :menu_dishes
  has_many :dishes, through: :menu_dishes

  scope :for_mealtime, ->(period) { where 'period = ?', Menu.periods["#{period}"] }
end
