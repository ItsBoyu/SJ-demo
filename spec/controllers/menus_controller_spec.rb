require 'rails_helper'

RSpec.describe MenusController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "has a 200 status code" do
      m1 = Menu.create
      get :show, params: {
        id: m1.id
      }
      expect(response.status).to eq(200)
    end
  end

  describe "GET search" do
    it "has a 200 status code" do
      get :search
      expect(response.status).to eq(200)
    end
  end
end