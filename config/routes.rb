Rails.application.routes.draw do
  resources :accounts_payables
  resources :accounts_receivables
  resources :purchases
  resources :budgets
  resources :sales
  resources :payment_types
  resources :products
  resources :people
  resources :categories
  devise_for :system_users
  devise_for :master_users
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
