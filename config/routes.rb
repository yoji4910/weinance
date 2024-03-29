Rails.application.routes.draw do
  root to: 'records#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    get '/login', to: 'users/sessions#new'
  end

  get '/privacy', to: 'static_pages#privacy'
  get '/about', to: 'static_pages#about'

  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    # resourcesにさらにルートを追加. memberは:idのあとに続くという意味
    get :follows, on: :member
    get :followers, on: :member
    post :relationships_inlist, to: 'relationships#create_inlist'
    delete :relationships_inlist, to: 'relationships#destroy_inlist'
    post :relationships_inshow, to: 'relationships#create_inshow'
    delete :relationships_inshow, to: 'relationships#destroy_inshow'
  end

  resources :records do
    resource :comments, only: [:create, :destroy]
  end

  resources :notifications, only: :index
  resources :health_check, only: [:index]
end
