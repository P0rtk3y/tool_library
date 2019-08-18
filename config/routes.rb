Rails.application.routes.draw do
  resources :tools
  root 'sessions#home'

  get '/signup' => 'libraries#new'
  get '/login' =>'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :libraries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
