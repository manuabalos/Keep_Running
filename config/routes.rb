Rails.application.routes.draw do
  
  root 'home#index'
  get 'home/profile'
  # ---------- SESSIONS -----------
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'routes/auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  delete 'routes/sign_out', to: 'sessions#destroy'

  resources :routes do
  	resources :waypoints
  end
  resources :histories

    # ---------- ADD HISTORY
  post 'routes/:id/history', to: 'routes#addHistory', as: 'add_history'

end
