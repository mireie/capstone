Rails.application.routes.draw do
  resources :venues do
    resources :shows
  end
  devise_for :users
  resources :shows
  root to: "venues#index"
end
