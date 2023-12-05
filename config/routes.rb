Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"

  get "/devs", to: "devs#index"
  get "/devs/new", to: "devs#new"
  post "/devs", to: "devs#create"
  get "/devs/:id", to: "devs#show"
  get "devs/:id/edit", to: "devs#edit"
  patch "devs/:id", to: "devs#update"

  get "/games", to: "games#index"
  get "/games/new", to: "games#new"
  post "/games", to: "games#create"
  get "/games/:id", to: "games#show"
  get "/games/:id/edit", to: "games#edit"
  patch "games/:id", to: "games#update"
  
  get "/devs/:id/games", to: "devs/games#index"
  get "/devs/:id/games/new", to: "devs/games#new"
  post "/devs/:id/games", to: "devs/games#create"
end
