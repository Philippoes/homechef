Rails.application.routes.draw do
  get 'orderitems/resources'

  get 'buyingorderlists/create'

  root controller: :landing, action: :index
  resources :dishes, only: [:index, :show]
  resources :buyingorderlists, :sellingorderlists, only: [:index, :create, :show, :edit, :update, :destroy ]
end
