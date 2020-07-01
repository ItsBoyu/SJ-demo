class MenusController < ApplicationController
  def index
    @menus = current_menu || Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def search
    menu = if params[:q].present?
      Dish.where('name like ?', "%#{params[:q]}%").first&.menus
    else
      Menu.all
    end
  
    render json: menu.to_json(include: [:dishes])
  end

  private

  def current_menu
    time = Time.now.strftime('%H').to_i
    case time
    when lunchtime = 11..15
      Menu.for_mealtime('lunch')
    when dinnertime = 17..21
      Menu.for_mealtime('dinner')
    end
  end
end
