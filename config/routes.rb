Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about", to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  
  #ネスト構造
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end