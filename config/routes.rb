Rails.application.routes.draw do
  namespace :backoffice do
    resources :accounts_payables
  end
  namespace :backoffice do
    resources :accounts_receivables
  end
  namespace :backoffice do
    resources :purchases
  end
  namespace :backoffice do
    resources :budgets
  end
  namespace :backoffice do
    resources :sales
  end
  namespace :backoffice do
    resources :payment_types
  end
  namespace :backoffice do
    resources :people
  end
  namespace :backoffice do
    resources :products
  end
  namespace :backoffice do
    resources :categories
  end
  namespace :backoffice do
    get 'dashboard/index'
  end
  namespace :site do
    get 'home/index'
  end
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
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
