Rails.application.routes.draw do
=begin
  maps requests for the URL /static_pages/help to the help action in the Static
  Pages controller.
=end

  root 'static_pages#home'
  get '/help', to: 'static_pages#help' #for help page
  get '/about', to: 'static_pages#about'  #for about
  get '/contact', to: 'static_pages#contact' #for contact
  get '/signup', to: 'users#new' #creating a new user

  get '/login', to: 'sessions#new' #login for user
  post '/login', to: 'sessions#create' #login
  delete '/logout', to: 'sessions#destroy' #logout for user
  #in resources for user
  resources :users
  #resources for account activation only for edit purpose.
  resources :account_activations, only: [:edit]
  #resources for password reset following purpose.
  resources :password_resets, only: [:new, :create, :edit, :update]
  #resources for microposts  following purpose.
  resources :microposts, only: [:create, :destroy]

end
