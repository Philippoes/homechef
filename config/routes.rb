Rails.application.routes.draw do
  root controller: :landing, action: :index
  resources :dishes, only: [:index, :show]
  resources :buyingorderlists, :sellingorderlists, only: [:index, :create, :show, :edit, :update, :destroy ]
end
