Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index destroy]
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
