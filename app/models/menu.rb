class Menu < ApplicationRecord
  enum period: %i[lunch dinner]

  has_many :dishes

  scope :for_mealtime, ->(period) { where 'period = ?', Menu.periods["#{period}"] }
end
