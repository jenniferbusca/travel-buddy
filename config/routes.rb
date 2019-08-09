Rails.application.routes.draw do
  root 'sessions#new'

  resources :users
  resources :itineraries do
    resources :itinerary_activities, only: [:new, :create, :edit, :update]
  end
  resources :itinerary_activities

  # get ':user_id/itineraries' => 'itineraries#index', :as => 'user_itineraries'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'auth/google_oauth2/callback' => 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

end
