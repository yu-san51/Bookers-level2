Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "home/about" => "home#about"

  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :following, :followers
    end
  end

  resources :books, only: [:create, :index, :show, :edit, :destroy, :update] do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create]
  end
  delete "book_comments/:id", to: "book_comments#destroy", as: "book_comments"
  resources :relationships, only: [:create, :destroy]
  get "/search" => "search#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
