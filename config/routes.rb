Rails.application.routes.draw do

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
  #Comments
  get '/comments', to: "comments#index", as: "comments"
  get '/comments/new', to: "comments#new", as: "new_comment"
  post '/comments/create', to: "comments#create"
  get '/comments/:id/edit', to: "comments#edit", as: "edit_comment"
  patch '/comments/:id/update', to: "comments#update"
  delete '/comments/:id/destroy', to: "comments#destroy"

end
