Rails.application.routes.draw do
  resources :maps_static_apis, only: :index
end
