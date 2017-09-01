Rails.application.routes.draw do

  resources :comments
  namespace :admin do
    root to: 'users#index'
  end

  resources :todos do
    collection do
      get :active, :completed, :clear
    end
  end
  resource :session

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  root to: 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
