Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"

  get "/devs", to: "devs#index"
  get "/devs/new", to: "devs#new"

  get "/games", to: "games#index"
  get "/games/new", to: "games#new"
end
