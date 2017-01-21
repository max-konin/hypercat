Rails.application.routes.draw do
  devise_for :users

  mount_ember_app :viewer, to: "/viewer"

  namespace :api do
    get 'sandbox' => 'sandbox#index'
    namespace :v1 do
      resources :edges
      resources :graphs
      resources :hypernets
      resources :edges_mappings
      resources :graphs_mappings
      resources :nodes
    end
  end
end
