Rails.application.routes.draw do
  resources :roles
  resources :worker_roles
  resources :workers
  resources :waybills
  resources :region_categories
  resources :price_rules do
    collection do
      get :addNewRule
      post :addNewRule
    end
  end
  resources :prices
  resources :items
  resources :factory_stations
  resources :factories do
    collection do
      get :getAllFactories
      post :getAllFactories
    end
  end
  resources :couriers
  resources :addresses
  resources :stations
  resources :orders
  resources :categories
  resources :products do 
  	collection do
  		get :getProductByCategory
  		post :getProductByCategory
  	end
  end
  resources :users do
  	collection do
  		get :login
  		post :login
  		get :register
  		post :register
  		get :getUsersByRole
  		post :getUsersByRole
      put :updateStationId
      patch :updateStationId
  	end
  end
  resources :listings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
