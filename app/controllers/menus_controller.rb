class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def search
    menu = if params[:q].present?
      Dish.where('name like ?', "%#{params[:q]}%").first&.menu
    else
      Menu.all
    end
  
    render json: menu.to_json(include: [:dishes])
  end
end
