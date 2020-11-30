Rails.application.routes.draw do
  devise_for :clinics
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clinics, only: [:index, :show, :new, :create]
  resources :vets, only: [:new, :create]
end
