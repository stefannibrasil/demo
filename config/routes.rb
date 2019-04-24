Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :line_items do
    member do
      patch "decrement"
    end
  end
  resources :carts
  root to: "store#index", as: 'store_index'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
