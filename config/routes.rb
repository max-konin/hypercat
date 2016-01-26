Rails.application.routes.draw do
  namespace :api do
    get 'sandbox' => 'sandbox#index'
    namespace :v1 do
      resources :hypernets
      resources :nodes
      resources :edges
      resources :graphs
    end
  end
end
