Rails.application.routes.draw do
  resources :maps_static_apis, only: :index
  resources :maps_javascript_apis, only: :index
end
