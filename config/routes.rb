Rails.application.routes.draw do
  # get 'home/top'
  get '/', to:'home#top' 
  get '/messagelist', to: 'home#message'
  get '/search', to: 'home#search'
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
  get '/image_of_boards/:id', to: 'boards#get_image', as: 'image_of_boards'
  get '/image_of_comments/:id', to: 'comments#get_image', as: 'image_of_comments'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #以下追記
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  get '/search', to: 'users#edit'
  delete '/unsubscribe', to: 'users#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
