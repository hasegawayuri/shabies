Rails.application.routes.draw do
  resources :icons
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
  get '/image_of_icons/:id', to: 'icons#get_image', as: 'image_of_icons' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
