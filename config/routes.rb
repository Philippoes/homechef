Rails.application.routes.draw do
  root controller: :landing, action: :index
  resources :dishes, only: [:index, :show]
  resources :orders, only: [:index, :create, :show, :edit, :update, :destroy ]
  post '/create_buyingorder', controller: :orders, action: :create_buyingorder, as: :create_buyingorder
  post '/create_sellingorder', controller: :orders, action: :create_sellingorder, as: :create_sellingorder
  post '/create_orderitem', controller: :orders, action: :create_orderitem, as: :create_orderitem
end
