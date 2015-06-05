Rails.application.routes.draw do
  
  get '/' => 'routes#index'
  get 'signup'  => 'users#new' 
  get 'login' => 'sessions#new'

  resources :users
  resources :routes do
  	resources :waypoints
  end


end
