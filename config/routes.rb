Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mains#index'

  get '/login', to: 'users#new', as: 'users'
  post '/login', to: 'users#create'
  delete '/logout', to: 'users#destroy'


  resources :albums do
  	resources :images, except: [:show]
  end
  
end
