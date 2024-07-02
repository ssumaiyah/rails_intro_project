Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'search', to: 'pages#search'

  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show, :new, :create]
  resources :genres, only: [:index, :show]
  resources :publishers, only: [:index, :show]
end
