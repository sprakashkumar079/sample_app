Rails.application.routes.draw do
=begin
  For details on the DSL available within this file,
  see https://guides.rubyonrails.org/routing.html
=end

  root 'application#hello'
=begin
  maps requests for the URL /static_pages/home to the home action in the Static
  Pages controller.
=end
  get 'static_pages/home'

=begin
  maps requests for the URL /static_pages/help to the help action in the Static
  Pages controller.
=end
  get 'static_pages/help'
  get 'static_pages/about'

end
