require 'rails_helper'

RSpec.describe Menu, type: :model do
  context 'enum' do
    it do
      should define_enum_for(:period).
        with_values([:lunch, :dinner])
    end
  end

  context 'associations' do
    it { should have_many(:menu_dishes)}
    it { should have_many(:dishes).through(:menu_dishes) }
  end
end
