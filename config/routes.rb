Rails.application.routes.draw do
  
  get '/' => 'routes#index'

  resources :routes do
  	resources :waypoints
  end


end
