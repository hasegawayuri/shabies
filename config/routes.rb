Rails.application.routes.draw do
  # get 'home/top'
  get '/', to:'home#top' 
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
  #以下追記
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
