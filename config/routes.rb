require 'sidekiq/web'
Rails.application.routes.draw do

  resources :announces do
    member do
      get :deliver
    end
  end
  mount Sidekiq::Web => '/sidekiq2'

  resources :comments do
    member do
      get :remove
    end
  end
  
  namespace :admin do
    root to: 'users#index'
  end

  resources :todos do
    collection do
      get :active, :completed, :clear, :my
    end
  end
  resource :account
  resource :session do
    member do
      post :verify_code, :send_code
    end
  end

  get 'login', to: 'sessions#new'
  get 'sms_login', to: 'sessions#sms_login'
  get 'logout', to: 'sessions#destroy'

  root to: 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
