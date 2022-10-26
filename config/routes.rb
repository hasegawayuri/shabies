Rails.application.routes.draw do
  resources :chats
  resources :rooms
  resources :classifications
  resources :tags
  resources :comments
  resources :members
  resources :gpins
  resources :bpins
  resources :boards
  resources :userrooms
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
