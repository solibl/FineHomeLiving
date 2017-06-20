Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mains#index'

  resources :albums do
  	resources :images, except: [:index, :show]
  end
  
end
