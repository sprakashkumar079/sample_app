Rails.application.routes.draw do
  get 'users/new'
=begin
  For details on the DSL available within this file,
  see https://guides.rubyonrails.org/routing.html
=end

  #root 'static_pages#home'
=begin
  maps requests for the URL /static_pages/home to the home action in the Static
  Pages controller.
=end
  #get 'static_pages/home'

=begin
  maps requests for the URL /static_pages/help to the help action in the Static
  Pages controller.

  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
=end
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  #in resources for user
  resources :users

end
