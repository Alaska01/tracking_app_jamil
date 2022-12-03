Rails.application.routes.draw do

  resources :customers do
    # resources :movements, except: [:index],  controller: 'customers/movements'
    collection {post :import}
    resources :movements, controller: 'customers/movements'
    
  end

end
