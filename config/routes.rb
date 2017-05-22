Rails.application.routes.draw do
  root to: "links#index"
  get      '/login',    to: 'session#new', as: "login"

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
