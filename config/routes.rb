Rails.application.routes.draw do
  get 'users/index'
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

  resources :users, only: [:index, :edit, :update, :edit]
  # get "/", to: "search/index"

  # The Route Below Must Stay At the buttom to redirect any route not found

  get '*path' => redirect('/')
end
