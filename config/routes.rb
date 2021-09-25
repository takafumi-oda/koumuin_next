Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root 'posts#index'
  namespace :admin do
    resources :users, only: %i[index destroy]
  end
  resources :users, only: %i[new create edit update show destroy]
  resources :password, only: %i[edit update]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :posts, only: %i[new create show destroy] do
    resources :replies, only: %i[create destroy]
  end
  resources :likes, only: %i[create destroy]
end
