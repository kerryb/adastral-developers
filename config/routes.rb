AdastralDevelopers::Application.routes.draw do
  root "pages#show", page: "home"
  resource :session, only: [:create]

  # omniauth routes
  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  match "/auth/failure", to: "sessions#failure", via: [:get, :post]
end
