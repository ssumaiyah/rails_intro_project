# config/routes.rb
Rails.application.routes.draw do
  root 'pages#home'          # Route for the main page
  get 'about', to: 'pages#about'    # Route for the about page
  get 'search', to: 'pages#search'  # Route for the search functionality
  
  resources :authors, only: [:index, :show]    # Routes for authors
  resources :books, only: [:index, :show]      # Routes for books
  resources :genres, only: [:index, :show]     # Routes for genres
  resources :publishers, only: [:index, :show] # Routes for publishers
end
