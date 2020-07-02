require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe 'GET /menus' do
    it 'returns a success response' do
      get menus_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /menus/:id' do
    context 'menu exists' do
      before do
        Menu.create(name: '1st Menu')
      end

      it 'returns a success response' do
        get menu_path(1)
        expect(response).to be_successful
        expect(response).to have_http_status(200)
        expect(response.body).to include('1st Menu')
      end
    end

    context 'menu does not exist' do
      it 'returns a 404 response' do
        get menu_path(1)
        expect(response).not_to be_successful
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'Search API' do
    before do
      m1 = Menu.create(name: '1st Menu')
      m2 = Menu.create(name: '2nd Menu')
      m1.dishes.create(name: '1st Dish')
      m2.dishes.create(name: '2nd Dish')
    end

    context 'GET /menus/search' do
      it 'returns a success response' do
        get search_menus_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context "search by dish's name" do
      context 'do not receive the params' do
        it 'returns all menus' do
          get search_menus_path
          expect(response.body).to include('1st Menu')
          expect(response.body).to include('1st Dish')
          expect(response.body).to include('2nd Menu')
          expect(response.body).to include('2nd Dish')
        end
      end

      context 'search result exist' do
        it 'returns the search result' do
          get search_menus_path, params: {
            q: 't'
          }
          expect(response.body).to include('1st Menu')
          expect(response.body).to include('1st Dish')
          expect(response.body).not_to include('2nd Menu')
        end
      end

      context 'search result dose not exist' do
        it 'returns null' do
          get search_menus_path, params: {
            q: 'a'
          }
          expect(response.body).to include('null')
        end
      end
    end
  end
end
