Rails.application.routes.draw do
  resources :users

  resources :dogs

  resources :playdates

  resources :comments

  resources :friendships
end
