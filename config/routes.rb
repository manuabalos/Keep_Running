Rails.application.routes.draw do
  
  root 'home#index'
  get 'home/profile' => 'home#profile'
  # API Login with Facebook, Twitter, Github
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  
  #get '/' => 'routes#index'
  get 'signup'  => 'users#new' 
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :routes do
  	resources :waypoints
  end


end
