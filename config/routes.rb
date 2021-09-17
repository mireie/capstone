Rails.application.routes.draw do
  resources :shows
  resources :venues do
    resources :shows
  end
  devise_for :users
  root to: "venues#index"
end
