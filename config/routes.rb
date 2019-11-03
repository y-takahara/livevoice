Rails.application.routes.draw do
  
  root "reviews#index"
  get "reviews/index" => "reviews#index"
end
