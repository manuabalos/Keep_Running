Rails.application.routes.draw do
  
  get '/' => 'routes#index'
  get 'signup'  => 'users#new' 
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :routes do
  	resources :waypoints
  end


end
