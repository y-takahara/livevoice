Rails.application.routes.draw do
  
  devise_for :users
  root "reviews#home"
  resources :reviews do
    resources :comments, omly:[:create]
  end
  resources :users, only:[:show]
  get "reviews/home" => "reviews#home"
  
 end
