Rails.application.routes.draw do
  resources :todos do
    collection do
      get :active, :completed, :clear
    end
  end
  root to: 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
