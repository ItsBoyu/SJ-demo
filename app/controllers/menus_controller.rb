class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def search
    menu = Menu.all
  
    render json: menu.to_json(include: [:dishes])
  end
end
