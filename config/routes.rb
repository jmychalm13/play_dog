Rails.application.routes.draw do
  post "/sessions" => "sessions#create"

  resources :users

  resources :dogs

  resources :playdates

  resources :comments

  resources :friendships

  resources :behaviors

  resources :cloudinary_test, only: [:index] do
    post :upload, on: :collection
  end
end
