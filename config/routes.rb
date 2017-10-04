ParticipantTracking::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :projects, only: [] do
        resources :participants, only: %i[index create update] do
          collection do
            post :batch_create
            put :batch_update
          end
        end
        resources :participant_properties, only: %i[index create update] do
          collection do
            post :batch_create
            put :batch_update
          end
        end
        resources :relationships, only: %i[index create update] do
          collection do
            post :batch_create
            put :batch_update
          end
        end
        resources :device_sync_entries, only: [:create]
        resources :properties, only: [:index]
        resources :participant_types, only: [:index]
        resources :relationship_types, only: [:index]
        resources :android_updates, only: %i[index show]
        devise_scope :user do
          post 'sessions' => 'sessions#create', :as => 'login'
          delete 'sessions' => 'sessions#destroy', :as => 'logout'
        end
      end
    end
    namespace :v2 do
      resources :rosters, only: [:create]
      resources :surveys, only: [:create]
      resources :responses, only: [:create]
    end
  end

  root 'projects#index'
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  resources :properties
  resources :participant_types do
    get :export, on: :member
  end
  resources :relationship_types
  resources :projects, only: %i[index show] do
    resources :participants, concerns: :paginatable do
      resources :participant_properties
      resources :relationships
    end
  end
  resources :devices do
    resources :device_sync_entries, only: [:index], concerns: :paginatable
  end
  resources :android_updates, only: %i[index show]
end
