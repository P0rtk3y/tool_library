Rails.application.routes.draw do
  root 'sessions#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'libraries#new'
  post '/signup' => 'libraries#create'

  delete '/logout' => 'sessions#destroy'
  resources :libraries do
    resources :tools
  end

  resource :sessions, :tools, :libraries, :loans, :borrowers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
