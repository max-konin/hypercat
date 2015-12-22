Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hypernets
      resources :nodes
    end
  end
end
