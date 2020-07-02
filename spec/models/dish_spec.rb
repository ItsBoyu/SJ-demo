require 'rails_helper'

RSpec.describe Dish, type: :model do
  context 'associations' do
    it { should have_many(:menu_dishes)}
    it { should have_many(:menus).through(:menu_dishes) }
  end
end
