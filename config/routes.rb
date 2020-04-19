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
  	resource :book_comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
