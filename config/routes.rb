Rails.application.routes.draw do
  
  root 'home#index'
  get 'home/profile'
  # ---------- SESSIONS -----------
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'routes/auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  delete 'routes/sign_out', to: 'sessions#destroy'

  # ---------- ADD HISTORY
  get 'routes/:id/history', to: 'routes#addHistory', as: 'addHistory'

  resources :routes do
  	resources :waypoints
  end


end
