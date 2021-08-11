Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index destroy]
  end
  resources :users, only: %i[new create edit update show destroy]
  resources :password, only: %i[edit update]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
