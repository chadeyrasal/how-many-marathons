Rails.application.routes.draw do
  
  root "welcome#home"

  get "/users/new", to: "users#new", as: :signup

  post "/users", to: "users#create"

  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

  get "/users/:id", to: "users#show", as: :user

  get "/runs", to: "runs#index"

end
