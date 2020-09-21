Rails.application.routes.draw do
  root "orders#index"
  resources :orders, except: :destroy
end
