Rails.application.routes.draw do
  root 'sessions#new'
  resources :itineraries
  resources :users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/auth/google_oauth2/', to: 'sessions#googleAuth'
  get 'auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

end
