Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "home/about" => "home#about"

  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update] do
  	resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
