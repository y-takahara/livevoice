Rails.application.routes.draw do
  
  devise_for :users
  root "reviews#home"
  get "reviews/home" => "reviews#home"
  get "reviews/index" => "reviews#index"
  get "reviews/new" => "reviews#new"
  post "reviews/create" => "reviews#create"
end
