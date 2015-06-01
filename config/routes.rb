Rails.application.routes.draw do
  
  get '/' => 'routes#index'

  resources :routes

end
