Rails.application.routes.draw do
  # get 'session_users/new'

  # get 'users/new'
  #
  # get 'password_resets/new'
  #
  # get 'password_resets/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "properties#index"

  # Agents routes
  get "/agents/signup", to: "agents#new"
  post "/agents/signup", to: "agents#create"
  # get "/agents/:id/edit", to: "agents#edit"
  patch "/agents/:id/edit", to: "agents#update"
  get "/agent", to: "agents#private_show", as: "private"

  # Users routes
  get "users/signup", to: "users#new"
  post "users/signup", to: "users#create"
  patch "users/:id/edit", to: "users#update"

  # Sessions routes
  get "/agents/login", to: "sessions#new"
  post "/agents/login", to: "sessions#create"
  delete "/agents/logout", to: "sessions#destroy"

  get "/users/login", to: "session_users#new"
  post "/users/login", to: "session_users#create"
  delete "/users/logout", to: "session_users#destroy"

  # resources routes
  resources :properties, :agents, :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
