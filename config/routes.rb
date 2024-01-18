Rails.application.routes.draw do
  post "/sessions" => "sessions#create"

  resources :users

  resources :dogs

  resources :playdates

  resources :comments

  resources :friendships

  resources :behaviors
end
