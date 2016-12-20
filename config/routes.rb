Rails.application.routes.draw do
  #get 'static/home'

 root 'static#home'
resources :users

resources :attractions

resources :rides

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end