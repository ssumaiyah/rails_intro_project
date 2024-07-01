Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :publishers, only: [:index, :show]
end