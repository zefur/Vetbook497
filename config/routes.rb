Rails.application.routes.draw do
  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root to: 'pages#home'
  get 'clinics/dash', to: 'clinics#dash'

  resources :clinics, only: [:new, :create, :show, :edit, :update] do
    member do
      delete :delete_photo
      delete :delete_pictures
      delete :delete_pic
    end
    resources :vets do
      member do
        delete :delete_photo
       end
    end
    resources :bookings, only: [:new, :create, :edit, :update] do
    member do
    get :toggle_accepted
    get :archive_booking
  end
end
  end
  get 'owners/dash', to: 'owners#dash'

  resources :owners, only: [:show, :edit, :update] do
    member do
      delete :delete_photo
     end
    resources :pets, only: [:new, :create, :show, :edit, :update, :destroy] do
       member do
        delete :delete_photo
       end
      resources :health_records do
        resources :vaccinations
        resources :diagnosis
      end
    end
  end

  resources :bookings, only: [:destroy]



  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :clinics, only: [ :index, :show ]
    end
  end


end
