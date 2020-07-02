class Menu < ApplicationRecord
  enum period: %i[lunch dinner]

  has_many :dishes
end
