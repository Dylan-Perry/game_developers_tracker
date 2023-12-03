Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"

  get "/devs", to: "devs#index"
  get "/devs/:id", to: "devs#show"
  get "/devs/:id/games", to: "devs#index_dev_games"
  get "/devs/new", to: "devs#new"
  post "/devs", to: "devs#create"

  get "/games", to: "games#index"
  get "/games/:id", to: "games#show"
  get "/games/new", to: "games#new"
  post "/games", to: "games#create"
  

end
