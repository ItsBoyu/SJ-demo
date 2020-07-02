Rails.application.routes.draw do
  root "menus#index"
  resources :menus, only: [:index, :show] do
    collection do
      get :search
    end
  end
end
