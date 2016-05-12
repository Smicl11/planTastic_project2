Rails.application.routes.draw do

  get 'comments/index', to: "comments#index", as: "comments"
  get 'comments/new', to: "comment#new", as: "comment_new"
  get 'comments/create', to: "comment#create"
  get 'comments/edit', to: "comment#edit", as: "comment_edit"
  get 'comments/update', to: "comment#update", as:
  get 'comments/destroy', to: "comment#destroy"

  #User routes
  root to: "users#index"
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"

  #Sessions
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

end
