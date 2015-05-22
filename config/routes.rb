ParticipantTracking::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :participants, only: [:index, :create, :update]
      resources :device_sync_entries, only: [:create]
      resources :properties, only: [:index]
      resources :participant_properties, only: [:index, :create, :update]
      resources :participant_types, only: [:index]
      resources :relationship_types, only: [:index]
      resources :relationships, only: [:index, :create, :update]
      resources :android_updates, only: [:index, :show]
      devise_scope :user do
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
    end
  end 
   
  root 'participants#index'
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end
  resources :properties 
  resources :participant_types do
    get :export, on: :member
  end
  resources :relationship_types
  resources :participants, :concerns => :paginatable do
      resources :participant_properties 
      resources :relationships
  end
  resources :device_sync_entries, only: [:index], :concerns => :paginatable

end
