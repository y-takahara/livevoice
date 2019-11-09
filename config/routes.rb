Rails.application.routes.draw do
  
  devise_for :users
  root "reviews#home"
  get "reviews/home" => "reviews#home"
  get "reviews/search" => "reviews#search"
  resources :reviews do
    resources :likes, only: [:create, :destroy]
    resources :comments, only:[:create,:destroy]
  end
  resources :users, only:[:show]
  
 end
