AdastralDevelopers::Application.routes.draw do
  resource :session, only: [:new]
  root "pages#show", page: "home"
end
