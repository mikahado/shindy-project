Rails.application.routes.draw do

  # get '/customers/punchcard_length/:n', to: 'customers#punchcard_length'

  # get 'customers/count/:n', to: 'customers#count'

  get '/count/:n', to: 'customers#count'
  
  resources :punchcards
  resources :customers 


  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end