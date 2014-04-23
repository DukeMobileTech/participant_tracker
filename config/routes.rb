ParticipantTracking::Application.routes.draw do
  
  root 'participants#index'
  resources :properties 
  resources :participant_types
  resources :participants do
      resources :participant_properties 
  end

end
