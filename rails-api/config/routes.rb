Rails.application.routes.draw do
  resources :regions do
    collection do
      get :getRegionId
      post :getRegionId
    end
  end
  resources :roles
  resources :worker_roles
  resources :workers
  resources :waybills do
    collection do
      get :getWaybillsByCourierId
      post :getWaybillsByCourierId
    end
  end
  resources :region_categories
  resources :price_rules do
    collection do
      get :addNewRule
      post :addNewRule
      get :findPriceRule
      post :findPriceRule
    end
  end
  resources :prices do
    collection do
      get :findByProductId
      post :findByProductId
    end
  end
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
  resources :stations do
    collection do
      get :getStationByRegion
      post :getStationByRegion
    end
  end
  resources :orders do
    collection do
      get :getOrdersAllInfo
      post :getOrdersAllInfo
      get :getOrdersByUserId
      post :getOrdersByUserId
    end
  end
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
