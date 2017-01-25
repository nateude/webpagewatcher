Rails.application.routes.draw do

  get 'tests/new'

  get 'websites/new'

  # Static Page Routes
  root 'static_pages#home'

  get  '/home',     to: 'static_pages#home'
  get  '/help',     to: 'static_pages#help'

  resources :websites

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
