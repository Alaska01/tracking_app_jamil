Rails.application.routes.draw do
  root "search#index"
  devise_for :users do
    post '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  get 'search', to: "search#index"

  resources :customers do
    # resources :movements, except: [:index],  controller: 'customers/movements'
    collection {post :import}
    resources :movements, controller: 'customers/movements'
    
  end

  # get "/", to: "search/index"

end
