require 'rails_helper'

RSpec.describe "Menus", type: :request do
  it 'returns a success response' do
    get menus_path
    expect(response.status).to eq(200)
  end
end
