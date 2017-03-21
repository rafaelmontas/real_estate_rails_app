Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "properties#index"
  get "/agents/signup", to: "agents#new"
  post "/agents/signup", to: "agents#create"
  resources :properties, :agents

end
