Rails.application.routes.draw do
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
  	end
  end
  resources :listings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
