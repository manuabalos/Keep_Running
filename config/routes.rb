Rails.application.routes.draw do
  
  root 'home#index'
  get 'home/profile'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

#  get '/' => 'routes#index'

  resources :routes do
  	resources :waypoints
  end



end
