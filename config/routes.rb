Rails.application.routes.draw do
  get '/login', to:'logins#new'
  post '/login', to:'logins#create'
  delete '/logout', to:'logins#destroy'

  resources :users
  resources :vets
  resources :pets
  resources :appointments
  root 'pets#index'
  get '/signup', to:'users#new'
  get '/login', to:'logins#new'
end
