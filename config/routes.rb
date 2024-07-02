# config/routes.rb
Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'search', to: 'pages#search'
  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :publishers, only: [:index, :show]
end
