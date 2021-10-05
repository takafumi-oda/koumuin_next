Rails.application.routes.draw do
  get 'search/search'
  root 'posts#index'
  namespace :admin do
    resources :users, only: %i[index edit update destroy]
  end
  resources :users, only: %i[new create edit update show] do
    member do
      get 'check'
      patch 'withdrawl'
    end
  end
  resources :password, only: %i[edit update]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :posts, only: %i[new create show destroy] do
    resources :replies, only: %i[create destroy]
  end
  resources :likes, only: %i[create destroy]
  resources :favorites, only: %i[index create destroy]
  get 'search', to: 'search#search'
end
