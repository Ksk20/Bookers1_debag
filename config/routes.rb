Rails.application.routes.draw do
	root to: 'home#top'

  resources :books, only: [:create, :index, :edit, :update, :show, :destroy]
  resources :users, only: [:show, :create, :index, :edit, :update]
end
