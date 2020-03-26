Rails.application.routes.draw do
  root "home#index"
  get "home/about" => "home#show"

  devise_for :users

  resources :books, only: [:create, :index, :show, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
