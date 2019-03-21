Rails.application.routes.draw do

  root to: 'pages#index'
  get '/home', to: 'pages#index' , as: 'home'
  get '/profile(/:name)', to: 'pages#profile', as:'profile'
  resources :posts
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
