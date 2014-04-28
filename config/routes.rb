ParticipantTracking::Application.routes.draw do
 
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :participants
      resources :properties
      resources :participant_properties
      resources :participant_types
    end
  end 
   
  root 'participants#index'
  resources :properties 
  resources :participant_types
  resources :participants do
      resources :participant_properties 
  end

end
