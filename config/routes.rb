Rails.application.routes.draw do
  
  root 'home#index'
  get 'home/profile'
  # ---------- SESSIONS -----------
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'routes/auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  delete 'routes/sign_out', to: 'sessions#destroy'

  # ---------- ADD HISTORY

  resources :routes do
  	resources :waypoints
  end
  resources :histories
  post 'routes/:id/history', to: 'routes#addHistory', as: 'add_history'


end
