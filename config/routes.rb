Rails.application.routes.draw do
  root "search#index"
  get 'search', to: "search#index"

  resources :customers do
    # resources :movements, except: [:index],  controller: 'customers/movements'
    collection {post :import}
    resources :movements, controller: 'customers/movements'
    
  end

end
