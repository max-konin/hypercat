Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    get 'sandbox' => 'sandbox#index'
    namespace :v1 do
      resources :edges
      resources :graphs
      resources :hypernets
      resources :mappings
      resources :nodes
    end
  end
end
