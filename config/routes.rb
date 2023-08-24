Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/me" => "users#show"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :games
  resources :series

  post "/user_games" => "user_games#create"
  delete "/user_games/:id" => "user_games#destroy"
end
