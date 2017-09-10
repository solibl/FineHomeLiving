Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mains#index'

  resources :albums do
  	resources :images, except: [:show]
  end
  
  get '/passwordchange', to: 'users#edit'

  get '/login', to: 'users#new', as: 'users'
  
  post '/login', to: 'users#create'
  
  post '/newpassword', to: 'users#newpassword'

  delete '/logout', to: 'users#destroy'
  
  post '/sendemail', to: 'mains#create'
  
end
