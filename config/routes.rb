Rails.application.routes.draw do
  resources :users

  resources :dogs

  resources :playdates

  resources :friendships
end
