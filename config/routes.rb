Rails.application.routes.draw do

  resources :movements, only: [:show]
  resources :customers do
    # resources :movements, except: [:index],  controller: 'customers/movements'
    resources :movements, controller: 'customers/movements'
    
  end

  # resources :movements, only: [:show]
  # , only: [:index, :new, :update, :create, :edit], 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
