Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :posts
  root "posts#index"
  get '/about', to: 'posts#about', as: :about
  # get '/posts/new', to: "posts#new"
  # get "/posts/:id", to: "posts#show", as: :post
  # post "/posts", to: "posts#create", as: :posts
  # get '/posts/:id/edit', to: "posts#edit", as: :edit_post
  # patch '/posts/:id', to: "posts#update"
  # delete '/posts/:id', to: "posts#destroy", as: :delete_post
end
