Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'libraries#new'
  get '/login' =>'sessions#new'
  post '/login' => 'sessions#create'

  resources :libraries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
