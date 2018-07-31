Rails.application.routes.draw do


  get 'admin', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :categories, except: [:show, :destroy]
    resources :people, except: [ :destroy]
    get 'categories/index'
    get 'people/index'
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
  end
  resources :accounts_payables
  resources :accounts_receivables
  resources :purchases
  resources :budgets
  resources :sales
  resources :payment_types
  resources :products

  devise_for :system_users
  devise_for :master_users

  get 'home/index'
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
