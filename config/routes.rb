ParticipantTracking::Application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :participants, only: [:index, :create, :update]
      resources :properties, only: [:index]
      resources :participant_properties, only: [:index, :create, :update]
      resources :participant_types, only: [:index]
      devise_scope :user do
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
    end
  end 
   
  root 'participants#index'
  resources :properties 
  resources :participant_types
  resources :participants do
      resources :participant_properties 
  end

end
