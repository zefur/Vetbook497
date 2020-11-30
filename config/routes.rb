Rails.application.routes.draw do
  devise_for :clinics
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clinics, only: [:index, :show, :new, :create] do 
    resources :vets, only: [:new, :create]
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :pets, only: [:show, :edit, :update, :destroy]
  resources :bookings, only: [:destroy]
end
