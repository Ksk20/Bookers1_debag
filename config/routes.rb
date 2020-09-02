Rails.application.routes.draw do
	root to: 'home#top'

  devise_for :users

   get "home/about" => "home#about"
  resources :books, only: [:create, :index, :edit, :update, :show, :destroy]
  resources :users, only: [:show, :create, :index, :edit, :update]
end
