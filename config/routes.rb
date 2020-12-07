Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'clinics/dash', to: 'clinics#dash'

  resources :clinics, only: [:index, :show, :new, :create] do
    resources :vets, only: [:new, :create, :edit, :update]
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  get 'owners/dash', to: 'owners#dash'
  resources :owners, only: [:show] do
    resources :pets, only: [:new, :create, :show, :edit, :update,:destroy]
  end

  resources :bookings, only: [:destroy]
  # resources :pets, only: [:destroy]

end
