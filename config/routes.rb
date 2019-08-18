Rails.application.routes.draw do
  resources :borrowers
  resources :loans
root 'sessions#home'

  get '/signup' => 'libraries#new'
  get '/login' =>'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :libraries do
    resources :tools
  end

  resource :sessions
  resource :tools


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
