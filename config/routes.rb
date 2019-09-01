Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'users#index'
  resources :users 
  resources :records
end
