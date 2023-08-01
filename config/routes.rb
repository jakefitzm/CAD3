Rails.application.routes.draw do
  resources :bookings
  #get 'pages/home'
  root 'pages#home'
  #get 'pages/about'
  get '/about' => 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
