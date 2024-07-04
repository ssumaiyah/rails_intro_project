Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'search', to: 'pages#search'

  resources :authors, only: [:index, :show]
  resources :books
  resources :genres, only: [:index, :show]
  resources :publishers, only: [:index, :show]
  resources :bookstores, only: [:index, :show, :new, :create, :edit, :update]
end
