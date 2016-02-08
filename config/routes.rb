Rails.application.routes.draw do
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
