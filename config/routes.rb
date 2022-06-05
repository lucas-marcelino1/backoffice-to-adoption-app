Rails.application.routes.draw do
  devise_for :user_pet_cares
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  resources :animals
  resources :adoptions, only: [:show, :new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :animals, only: [:show, :index, :create]
    end
  end
end
