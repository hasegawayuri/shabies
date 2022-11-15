Rails.application.routes.draw do
  # get 'home/top'
  get '/', to:'home#top' 
  get '/messagelist', to: 'home#message'
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
  resources :users
  get '/image_of_icons/:id', to: 'icons#get_image', as: 'image_of_icons' 
  get '/image_of_groups/:id', to: 'groups#get_image', as: 'image_of_groups' 
  get '/image_of_users/:id', to: 'users#get_image', as: 'image_of_users' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #以下追記
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  delete '/unsubscribe', to: 'users#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
