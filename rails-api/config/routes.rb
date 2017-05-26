Rails.application.routes.draw do
  resources :settlements do
    collection do
      get :meter
      post :meter
      get :valuate
      post :valuate
    end
  end
  resources :turnovers
  resources :discount_rules do
    collection do
      get :getRulesByType
      post :getRulesByType
    end
  end
  resources :cards do
    collection do
      get :systemRecharge
      post :systemRecharge
      get :userRecharge
      post :userRecharge
      get :spend
      post :spend
    end
  end
  resources :regions do
    collection do
      get :getRegionId
      post :getRegionId
      get :openRegion
      post :openRegion
      get :closeRegion
      post :closeRegion
      get :getRegionsStatus1
      post :getRegionsStatus1
    end
  end
  resources :roles
  resources :worker_roles
  resources :workers
  resources :waybills do
    collection do
      get :getWaybillsByCourierId
      post :getWaybillsByCourierId
      get :getWaybillByStatus
      post :getWaybillByStatus
      get :getWaybillByStatusAndId
      post :getWaybillByStatusAndId
    end
  end
  resources :region_categories
  resources :price_rules do
    collection do
      get :addNewRule
      post :addNewRule
      get :findPriceRule
      post :findPriceRule
      get :findByRegionId
      post :findByRegionId
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
      get :login
      post :login
      get :getFactoryByStation
      post :getFactoryByStation
      get :getFactoryByRegion
      post :getFactoryByRegion
    end
  end
  resources :couriers do
    collection do
      get :login
      post :login
    end
  end
  resources :addresses
  resources :stations do
    collection do
      get :getStationByRegion
      post :getStationByRegion
      get :createStation
      post :createStation
      get :editRegion
      post :editRegion
    end
  end
  resources :orders do
    collection do
      get :getOrdersAllInfo
      post :getOrdersAllInfo
      get :getOrdersByUserId
      post :getOrdersByUserId
      get :getOrdersByCourierId
      post :getOrdersByCourierId
      get :getOrdersByFactoryId
      post :getOrdersByFactoryId
      get :getOrdersByStatus
      post :getOrdersByStatus
    end
  end
  resources :categories
  resources :products do 
  	collection do
  		get :getProductByCategory
  		post :getProductByCategory
      get :getProductNotDel
      post :getProductNotDel
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
