Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: "users/registrations"
  }

  namespace :admin do
    resources :users
  end 

  root "home#index"
  get "home/about" => "home#about"

  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :follow, :followed
    end
  end

  resources :books, only: [:create, :index, :show, :edit, :destroy, :update] do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create]
  end
  delete "book_comments/:id", to: "book_comments#destroy", as: "book_comments"
  resources :relationships, only: [:create, :destroy]

  get "/search" => "search#search"

  resources :rooms, only: [:create]
  get "/chat/:id" => "chats#show", as: "chat"
  post "/chat" => "chats#create", as: "chats"
  resources :user_rooms, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
