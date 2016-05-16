Rails.application.routes.draw do

  #User routes
  root to: "users#index"
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create", as: "create_user"
  get "/users/:id", to: "users#show", as: "user"
  get "users/:id/edit", to: "users#edit", as:"user_edit"
  patch "/users/:id", to: "users#update", as: "update_user"
  delete '/users/:id', to: "users#destroy", as: "destroy_user"

  #Sessions
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  #Comments
  get '/comments/new', to: "comments#new", as: "new_comment"
  post '/comments/create', to: "comments#create"
  get '/comments/:id/edit', to: "comments#edit", as: "edit_comment"
  patch '/comments/:id', to: "comments#update"
  delete '/comments/:id', to: "comments#destroy"


  #Events
  get "/events", to: "events#index", as: "events"
  get "/events/new", to: "events#new", as: "new_event"
  post "/events", to: "events#create", as: "create_event"
  get "/events/:id", to: "events#show", as: "event"
  get "/events/:id/edit", to: "events#edit", as: "edit_event"
  patch "/events/:id", to: "events#update", as: "update_event"
  delete "/events/:id", to: "events#destroy", as: "delete_event"

  #Attend
  get "/events/:id/attend/new", to: "attendances#new", as: "new_attendance"
  post "/events/:id/attend", to: "attendances#create", as: "create_attendance"


end
