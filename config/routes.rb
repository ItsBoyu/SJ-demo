Rails.application.routes.draw do
  root "menus#index"
  resources :menus, only: [:index]
end
