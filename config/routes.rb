Rails.application.routes.draw do
  resources :transactions
  devise_for :users
  resources :categories
  resources :stores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'index/about'
  root 'index#index'

  namespace :charts do
    get "user-transactions"
  end

end
