Rails.application.routes.draw do
  devise_for :users do
    post '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "search#index"
  get 'search', to: "search#index"

  resources :customers do
    # resources :movements, except: [:index],  controller: 'customers/movements'
    collection {post :import}
    resources :movements, controller: 'customers/movements'
    
  end

end
