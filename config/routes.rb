Rails.application.routes.draw do
  # User routes
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"
  
  post "/sessions" => "sessions#create"

  # Application routes
  get "/applications" => "applications#index"
  post "/applications" => "applications#create"
  get "/applications/:id" => "applications#show"
  patch "/applications/:id" => "applications#update"
  delete "/applications/:id" => "applications#destroy"
end
