require 'rails_helper'

RSpec.describe MenuDish, type: :model do
  context 'associations' do
    it { should belong_to(:dish)}
    it { should belong_to(:menu) }
  end
end
