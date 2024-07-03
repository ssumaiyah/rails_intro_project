Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'bookstores/index'
  get 'bookstores/show'
  get 'bookstores/new'
  get 'bookstores/create'
  get 'bookstores/edit'
  get 'bookstores/update'
  get 'bookstores/destroy'
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'search', to: 'pages#search'

  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show, :new, :create, :edit, :update]
  resources :genres, only: [:index, :show]
  resources :publishers, only: [:index, :show]
  resources :bookstores
end
