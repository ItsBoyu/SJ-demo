class MenusController < ApplicationController
  def index
    @menus = current_menu || Menu.includes(:dishes)
  end

  def show
    @menu = Menu.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html', 
           status: 404
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
      Menu.for_mealtime('lunch').includes(:dishes)
    when dinnertime = 17..21
      Menu.for_mealtime('dinner').includes(:dishes)
    end
  end
end
