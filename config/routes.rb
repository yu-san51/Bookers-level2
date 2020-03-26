Rails.application.routes.draw do
  "/" => "home#index"
  "/home/about" => "home#show"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
