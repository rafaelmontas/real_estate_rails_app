Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "/images/upload"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"

  # Agents routes
  get "/agents/signup", to: "agents#new"
  post "/agents/signup", to: "agents#create"
  # get "/agents/:id/edit", to: "agents#edit"
  patch "/agents/:id/edit", to: "agents#update"
  get "/agent", to: "agents#private_show", as: "private"
  get "/agent/pending_properties", to: "agents#pending_properties", as: "pending_properties"

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
  resources :properties, only: [:show, :index] do
    resources :photos
    resource :like, module: :properties
  end
  resources :agents do
    resources :properties, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :agents, :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :password_reset_users, only: [:new, :create, :edit, :update]
end
