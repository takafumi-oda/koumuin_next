Rails.application.routes.draw do
  get 'search/search'
  root 'posts#index'
  namespace :admin do
    resources :users, only: %i[index edit update]
  end
  resources :users, only: %i[new create edit update show] do
    member do
      patch 'withdrawl'
      get 'posts'
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
  get 'terms', to: 'text#terms'
  get 'privacy', to: 'text#privacy'
end
