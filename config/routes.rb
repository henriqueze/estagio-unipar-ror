Rails.application.routes.draw do
  devise_for :system_users
  devise_for :master_users
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
