Rails.application.routes.draw do
  get "/shows/all-ages" => "shows#all_ages"
  get "/" => "home#index"
  devise_for :users
  resources :shows
  resources :venues do
    resources :shows
  end
  root to: "home#index"
end
