Rails.application.routes.draw do
  get "/shows/all-ages" => "shows#all_ages"
  devise_for :users
  resources :shows
  resources :venues do
    resources :shows
  end
  root to: "venues#index"
end
