Rails.application.routes.draw do
  devise_for :users
  root to: "data_point_collections#index"
  resources :data_points
  resources :data_point_collections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
