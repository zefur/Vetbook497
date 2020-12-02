Rails.application.routes.draw do
  devise_for :clinics
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'clinics/dash', to: 'clinics#dash'
  resources :clinics, only: [:index, :show, :new, :create] do 
    resources :vets, only: [:new, :create, :edit, :update]
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  get 'users/dash', to: 'users#dash'
  resources :users, only: [:show] do
    resources :pets, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  
  resources :bookings, only: [:destroy]

  
end
