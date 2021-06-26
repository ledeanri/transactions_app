Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  resources :accounts, only: [:index, :show]
end
