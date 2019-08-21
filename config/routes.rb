Rails.application.routes.draw do
  root 'sessions#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'libraries#new'
  post '/signup' => 'libraries#create'

  delete '/logout' => 'sessions#destroy'

  resources :borrowers do
    resources :loans
  end
  resources :loans
  resources :tools do
    resources :loans
  end

  resources :libraries, only: [:new, :show, :create]

  get '/auth/google_oauth2/callback' => 'sessions#google_login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
