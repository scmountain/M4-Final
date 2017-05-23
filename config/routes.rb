Rails.application.routes.draw do
  root to: "links#index"

  post '/', to: 'links#create'
  get '/signup', to: 'users#new', as: "signup"
  post '/users', to: 'users#create'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
